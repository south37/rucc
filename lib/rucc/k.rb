require "rucc/keyword"

module Rucc
  module K
    # Container of keyword
    # @key [String]
    # @value [Keyword]
    @keywords = {}

    class << self
      def keywords
        @keywords
      end

    private

      # @param [Symbol] name keyword name
      # @param [String] str String representation
      # @param [Boolean] is_type
      def keyword(name, str, is_type)
        k = Keyword.new(str, is_type)
        const_set(name, k)
        @keywords[str] = k
      end
    end

    keyword :ALIGNAS,       "_Alignas",       true
    keyword :ALIGNOF,       "_Alignof",       false
    keyword :AUTO,          "auto",           true
    keyword :BOOL,          "_Bool",          true
    keyword :BREAK,         "break",          false
    keyword :CASE,          "case",           false
    keyword :CHAR,          "char",           true
    keyword :COMPLEX,       "_Complex",       true
    keyword :CONST,         "const",          true
    keyword :CONTINUE,      "continue",       false
    keyword :DEFAULT,       "default",        false
    keyword :DO,            "do",             false
    keyword :DOUBLE,        "double",         true
    keyword :ELSE,          "else",           false
    keyword :ENUM,          "enum",           true
    keyword :EXTERN,        "extern",         true
    keyword :FLOAT,         "float",          true
    keyword :FOR,           "for",            false
    keyword :GENERIC,       "_Generic",       false
    keyword :GOTO,          "goto",           false
    keyword :IF,            "if",             false
    keyword :IMAGINARY,     "_Imaginary",     true
    keyword :INLINE,        "inline",         true
    keyword :INT,           "int",            true
    keyword :LONG,          "long",           true
    keyword :NORETURN,      "_Noreturn",      true
    keyword :REGISTER,      "register",       true
    keyword :RESTRICT,      "restrict",       true
    keyword :RETURN,        "return",         false
    keyword :HASHHASH,      "##",             false
    keyword :SHORT,         "short",          true
    keyword :SIGNED,        "signed",         true
    keyword :SIZEOF,        "sizeof",         false
    keyword :STATIC,        "static",         true
    keyword :STATIC_ASSERT, "_Static_assert", false
    keyword :STRUCT,        "struct",         true
    keyword :SWITCH,        "switch",         false
    keyword :ELLIPSIS,      "...",            false
    keyword :TYPEDEF,       "typedef",        true
    keyword :TYPEOF,        "typeof",         true
    keyword :UNION,         "union",          true
    keyword :UNSIGNED,      "unsigned",       true
    keyword :VOID,          "void",           true
    keyword :VOLATILE,      "volatile",       true
    keyword :WHILE,         "while",          false
  end
end
