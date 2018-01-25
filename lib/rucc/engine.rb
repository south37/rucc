require "rucc/option"
require "rucc/parser"
require "rucc/gen"

module Rucc
  class Engine
    # When io is specified, io is used as input source. When io is not specified,
    # ARGV[0] is considered as sourcde file.
    #
    # @param [<String>] argv
    # @param [IO, NilClass] input
    def initialize(argv, input = nil)
      @option = Option.new
      @option.parse!(argv)

      if input
        @filename = "-"
      else
        @filename = argv.first
        input = File.open(@filename)
      end

      # Setup lexer
      @lexer = Lexer.new(input, @filename)

      # Setup parser
      label_gen = LabelGen.new
      @parser = Parser.new(@lexer, label_gen)
      @lexer.expr_reader = -> { @parser.read_expr }

      # Setup gen
      @out = StringIO.new
      @gen = Gen.new(@out, label_gen)

      init_environment!
    end

    # NOTE: Used only for debug
    def lex
      r = []
      while (tok = @lexer.lex).kind != T::EOF
        r.push(tok)
      end
      r
    end

    def parse
      @parser.read_toplevels
    end

    def gen
      parse.each do |toplevel_ast|
        @gen.emit_toplevel(toplevel_ast)
      end
      @out.rewind
      @out.read
    end

    def run!
      asm = gen

      if @option.dumpasm
        File.write(outfile('s'), asm)
        return
      end

      File.write(tmpfile('s'), asm)
      assemble!(src: tmpfile('s'), dst: tmpfile('o'))

      if @option.dontlink
        FileUtils.copy(tmpfile('o'), outfile('o'))
        return
      end

      link!(src: tmpfile('o'), dst: "a.out")
    end

  private

    def tmpfile(ext)
      "/tmp/ruccXXXXXX.#{ext}"
    end

    def outfile(ext)
      @filename.gsub(/\.c$/, ".#{ext}")
    end

    def assemble!(src:, dst:)
      # TODO(south37) Check status code
      `as -o #{dst} -c #{src}`
    end

    def link!(src:, dst:)
      # TODO(south37) Check status code
      `/usr/lib/gcc/x86_64-linux-gnu/6/collect2 -plugin /usr/lib/gcc/x86_64-linux-gnu/6/liblto_plugin.so -plugin-opt=/usr/lib/gcc/x86_64-linux-gnu/6/lto-wrapper -plugin-opt=-fresolution=/tmp/ccGgKweC.res -plugin-opt=-pass-through=-lgcc -plugin-opt=-pass-through=-lgcc_s -plugin-opt=-pass-through=-lc -plugin-opt=-pass-through=-lgcc -plugin-opt=-pass-through=-lgcc_s --sysroot=/ --build-id --eh-frame-hdr -m elf_x86_64 --hash-style=gnu --as-needed -dynamic-linker /lib64/ld-linux-x86-64.so.2 -pie -z now -z relro /usr/lib/gcc/x86_64-linux-gnu/6/../../../x86_64-linux-gnu/Scrt1.o /usr/lib/gcc/x86_64-linux-gnu/6/../../../x86_64-linux-gnu/crti.o /usr/lib/gcc/x86_64-linux-gnu/6/crtbeginS.o -L/usr/lib/gcc/x86_64-linux-gnu/6 -L/usr/lib/gcc/x86_64-linux-gnu/6/../../../x86_64-linux-gnu -L/usr/lib/gcc/x86_64-linux-gnu/6/../../../../lib -L/lib/x86_64-linux-gnu -L/lib/../lib -L/usr/lib/x86_64-linux-gnu -L/usr/lib/../lib -L/usr/lib/gcc/x86_64-linux-gnu/6/../../.. #{src} -o #{dst} -lgcc --as-needed -lgcc_s --no-as-needed -lc -lgcc --as-needed -lgcc_s --no-as-needed /usr/lib/gcc/x86_64-linux-gnu/6/crtendS.o /usr/lib/gcc/x86_64-linux-gnu/6/../../../x86_64-linux-gnu/crtn.o`
    end

    def init_environment!
      pre_difined_include_path.each do |path|
        @lexer.append_include_path(path)
      end

      @option.include_path.each do |path|
        @lexer.append_include_path(path)
      end

      read_from_string("#include <#{::Rucc.root}/include/rucc.h>")
    end

    def pre_difined_include_path
      [
        "#{::Rucc.root}/include",
        "/usr/local/lib/rucc/include",
        "/usr/local/include",
        "/usr/include",
        "/usr/include/linux",
        "/usr/include/x86_64-linux-gnu",
      ]
    end

    # Reads from a string as if the string is a content of input file.
    # Convenient for evaluating small string snippet contaiing preprocessor macros.
    #
    # @param [String] buf
    def read_from_string(buf)
      @lexer.stream_stash([FileIO.new(StringIO.new(buf), "-")])
      parse.each do |toplevel_ast|
        @gen.emit_toplevel(toplevel_ast)
      end
      @lexer.stream_unstash
    end
  end
end
