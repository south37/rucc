require "rucc/token"

module Rucc
  class TokenGen
    # @param [FileIOList] files
    def initialize(files)
      @files = files
      @pos = nil
    end
    attr_reader :pos
    attr_writer :pos

    # @param [T] kind
    # @param [Hash] value
    # @return [Token]
    def make_token(kind, value = {})
      f = @files.current
      Util.assert!{ !pos.nil? }
      params = {
        file: f,
        count: f.ntok,
        hideset: Set.new,
        line: pos.line,
        column: pos.column,
      }
      f.incr_ntok!
      Token.new(kind, value.merge(params))
    end

    # @param [String] s
    # @return [Token]
    def make_number(s)
      make_token(T::NUMBER, sval: s)
    end

    # @param [String] p
    # @return [Token]
    def make_ident(p)
      make_token(T::IDENT, sval: p)
    end

    # @param [Integer] c
    # @param [ENC] enc
    # @return [Token]
    def make_char(c, enc)
      make_token(T::CHAR, c: c, enc: enc)
    end

    # @param [String] s
    # @param [ENC] enc
    # @return [Token]
    def make_strtok(s, enc)
      make_token(T::STRING, sval: s, enc: enc)
    end

    # @param [Char] id
    # @return [Token]
    def make_keyword(id)
      make_token(T::KEYWORD, id: id)
    end

    # @param [Integer] c
    # @return [Token]
    def make_invalid(c)
      make_token(T::INVALID, c: c)
    end
  end
end
