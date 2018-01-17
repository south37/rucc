module Rucc
  module T
    IDENT   = "T::IDENT".freeze
    KEYWORD = "T::KEYWORD".freeze
    NUMBER  = "T::NUMBER".freeze
    CHAR    = "T::CHAR".freeze
    STRING  = "T::STRING".freeze
    EOF     = "T::EOF".freeze
    INVALID = "T::INVALID".freeze

    # Only in preprocessor
    NEWLINE     = "T::NEWLINE".freeze
    SPACE       = "T::SPACE".freeze
    MACRO_PARAM = "T::MACRO_PARAM".freeze

    CPP_TOKENS = [NEWLINE, SPACE, MACRO_PARAM].freeze
  end
end
