module Rucc
  class Kind
    include Comparable

    class << self
      def def_kind(name, id)
        const_set(name, self.new(id, name))
      end
    end

    def initialize(id, name)
      @id  = id  # Used only for <=>
      @name = name
    end
    attr_reader :id

    def <=>(other)
      @id <=> other.id
    end

    def to_s
      @name.to_s
    end

    def_kind :VOID,    0
    def_kind :BOOL,    1
    def_kind :CHAR,    2
    def_kind :SHORT,   3
    def_kind :INT,     4
    def_kind :LONG,    5
    def_kind :LLONG,   6
    def_kind :FLOAT,   7
    def_kind :DOUBLE,  8
    def_kind :LDOUBLE, 9
    def_kind :ARRAY,   10
    def_kind :ENUM,    11
    def_kind :PTR,     12
    def_kind :STRUCT,  13
    def_kind :FUNC,    14
    # used only in parser
    def_kind :STUB,    15
  end
end
