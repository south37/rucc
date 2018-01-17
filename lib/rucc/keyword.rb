module Rucc
  class Keyword
    def initialize(str, is_type)
      @str = str
      @is_type = is_type
    end
    attr_reader :str

    def is_type?
      @is_type
    end

    def to_s
      @str
    end
  end
end
