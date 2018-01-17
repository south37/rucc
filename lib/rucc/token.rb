require "rucc/enc"
require "rucc/k"
require "rucc/op"
require "rucc/t"

module Rucc
  class Token
    # @param [T] kind
    # @param [FileIO] file
    # @param [Integer] count
    # @param [Set] hideset
    # @param [String, Keyword, Op] id
    # @param [String] sval
    # @param [Integer] c
    # @param [ENC] enc
    # @param [Boolean] is_vararg
    # @param [Integer] position
    def initialize(kind,
                   file: nil,
                   count: nil,             # Token number in a file, counting from 0
                   line: nil, column: nil, # Token location in a file
                   hideset: nil,           # used by the preprocessor for macro expansion
                   space: false,           # true if the token has a leading space
                   bol: nil,               # true if the token is at the beginning of a line
                   id: nil,                           # KEYWORD
                   sval: nil,      c: nil, enc: nil,  # STRING or CHAR
                   is_vararg: nil, position: nil      # MACRO_PARAM
                  )
      @kind = kind
      @file = file
      @count = count
      @line = line; @column = column
      @hideset = hideset
      @space = space
      @bol = bol

      # value
      @id = id                                      # KEYWORD
      @sval = sval;           @c = c; @enc = enc;   # STRING or CHAR
      @is_vararg = is_vararg; @position = position  # MACRO_PARAM
    end
    attr_reader :kind, :id, :sval, :c, :enc, :space, :hideset, :file, :count,          :bol, :is_vararg, :position
    attr_writer :kind, :id, :sval,     :enc, :space, :hideset,                :column, :bol

    # @return [String]
    def to_s
      case kind
      when T::IDENT
        return sval
      when T::KEYWORD
        case self
        when Operator, Keyword
          return str
        else
          return "#{id}"
        end
      when T::CHAR
        return "#{encoding_prefix(enc)}'#{Util.quote_char(c)}'"
      when T::NUMBER
        return sval
      when T::STRING
        return "#{encoding_prefix(enc)}\"#{Util.quote_cstring(sval)}\""
      when T::EOF
        return "(eof)"
      when T::INVALID
        return "#{c}"
      when T::NEWLINE
        return "(newline)"
      when T::SPACE
        return "(space)"
      when T::MACRO_PARAM
        return "(macro-param)"
      else
        raise "internal error: unknown token kind: #{kind}"
      end
    end

  private

    # @param [ENC]
    def encoding_prefix(enc)
      case enc
      when ENC::CHAR16 then return "u"
      when ENC::CHAR32 then return "U"
      when ENC::UTF8   then return "u8"
      when ENC::WCHAR  then return "L"
      else                  return ""
      end
    end

    class << self
      # @param [Token] tok
      # @param [String] id
      # @return [Boolean]
      def is_keyword?(tok, id)
        tok.kind == T::KEYWORD && tok.id == id
      end

      # @param [Token] tok
      # @param [String] s
      # @return [Boolean]
      def is_ident?(tok, s)
        tok.kind == T::IDENT && tok.sval == s
      end
    end
  end

  Token::SPACE_TOKEN   = Token.new(T::SPACE)
  Token::NEWLINE_TOKEN = Token.new(T::NEWLINE)
  Token::EOF_TOKEN     = Token.new(T::EOF)
end
