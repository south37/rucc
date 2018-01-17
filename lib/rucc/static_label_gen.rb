module Rucc
  class StaticLabelGen
    def initialize
      @id = 0  # [Integer]
    end

    # @param [String]
    # @return [String]
    def next(name)
      static_label = ".S#{@id}.#{name}"
      @id += 1
      static_label
    end
  end
end
