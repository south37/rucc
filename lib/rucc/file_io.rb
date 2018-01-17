module Rucc
  class FileIO
    EOF = nil

    # @param [IO] io
    # @param [String] name
    def initialize(io, name)
      @io = io
      @name = name
      @line = 1
      @column = 1
      @ntok = 0  # Token counter
      @buflen = 0
      @buf = Array.new(3)
      @last = Object.new  # NOTE: Not use nil because nil means EOF. Set dummy data at first.

      # TODO(south37) Set @mtime
      # struct stat st;
      # if (fstat(fileno(file), &st) == -1)
      #     error("fstat failed: %s", strerror(errno));
      # r->mtime = st.st_mtime;
    end
    attr_reader :name, :line, :column, :ntok
    attr_writer :name, :line

    # @return [Char, NilClass] nil at EOF
    def readc
      while true do
        c = get
        if c == EOF
          return c
        end
        if (c != "\\")
          return c
        end
        c2 = get
        if c2 == "\n"
          next
        end
        unreadc(c2)
        return c
      end
    end

    # @param [Char] c
    def unreadc(c)
      return if c == EOF
      Util.assert!{ @buflen < @buf.size }
      @buf[@buflen] = c
      @buflen += 1
      if c == "\n"
        @column = 1
        @line -= 1
      else
        @column -= 1
      end
    end

    def incr_ntok!
      @ntok += 1
    end

    def close
      @io.close
    end

    def mtime
      Util.assert!{ @io.is_a?(File) }
      File.mtime(@io)
    end

  private

    # @return [Char, NilClass] nil at EOF
    def get
      if @buflen > 0
        @buflen -= 1
        c = @buf[@buflen]
      else
        c = readc_file
      end

      if c == "\n"
        @line += 1
        @column = 1
      elsif c != EOF
        @column += 1
      end
      c
    end

    # @return [Char, NilClass] nil at EOF
    def readc_file
      c = @io.getc
      if c == EOF
        c = (@last == "\n" || @last == EOF) ? nil : "\n"
      elsif c == "\r"
        c2 = @io.getc
        if c2 != "\n"
          @io.ungetc(c2)
        end
        c = "\n"
      end
      @last = c
      c
    end
  end
end
