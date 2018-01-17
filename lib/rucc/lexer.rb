require "rucc/libc"
require "rucc/token"
require "rucc/util"

require "rucc/lexer/impl"
require "rucc/lexer/preprocessor"

require "rucc/file_io"
require "rucc/file_io_list"

module Rucc
  class Lexer
    extend Forwardable

    # TODO(south37) Impl file management as input
    # @param [IO] input buffered io of C sourcecode.
    # @param [String] filename
    def initialize(input, filename)
      @files = FileIOList.new(FileIO.new(input, filename))
      @impl = Impl.new(@files)
      @preprocessor = Preprocessor.new(@impl)
    end

    delegate [
      :read_token,
      :unget_token,
      :peek_token,
      :append_include_path,
      :expr_reader=,
    ] => :@preprocessor

    delegate [
      :stream_stash,
      :stream_unstash,
    ] => :@files

    # NOTE: Used only for debug
    delegate [:lex] => :@impl
  end
end
