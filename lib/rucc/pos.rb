module Rucc
  class Pos
    # @param [Integer] line
    # @param [Integer] column
    def initialize(line, column)
      @line = line
      @column = column
    end
    attr_reader :line, :column
  end
end
