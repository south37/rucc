module Rucc
  class Operator
    def initialize(name, str)
      @name = name
      @str  = str
    end
    attr_reader :str

    def to_s
      @str
    end
  end
end
