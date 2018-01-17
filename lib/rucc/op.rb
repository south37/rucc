require "rucc/operator"

module Rucc
  module OP
    # Container of operators used as keyword in C-code
    # @key [String]
    # @value [Operator]
    @operators = {}

    class << self
      def operators
        @operators
      end

    private

      # @param [Symbol] name keyword name
      # @param [String] str String representation
      def op(name, str)
        o = Operator.new(name, str)
        const_set(name, o)
        @operators[str] = o
      end
    end

    op :ARROW,  "->"
    op :A_ADD,  "+="
    op :A_AND,  "&="
    op :A_DIV,  "/="
    op :A_MOD,  "%="
    op :A_MUL,  "*="
    op :A_OR,   "|="
    op :A_SAL,  "<<="
    op :A_SAR,  ">>="
    op :A_SUB,  "-="
    op :A_XOR,  "^="
    op :DEC,    "--"
    op :EQ,     "=="
    op :GE,     ">="
    op :INC,    "++"
    op :LE,     "<="
    op :LOGAND, "&&"
    op :LOGOR,  "||"
    op :NE,     "!="
    op :SAL,    "<<"
    op :SAR,    ">>"

    # Not used as keyword in C-code
    SIZEOF     = "OP::SIZEOF"
    CAST       = "OP::CAST"
    SHR        = "OP::SHR"
    SHL        = "OP::SHL"
    A_SHR      = "OP::A_SHR"
    A_SHL      = "OP::A_SHL"
    PRE_INC    = "OP::PRE_INC"
    PRE_DEC    = "OP::PRE_DEC"
    POST_INC   = "OP::POST_INC"
    POST_DEC   = "OP::POST_DEC"
    LABEL_ADDR = "OP::LABEL_ADDR"
  end
end
