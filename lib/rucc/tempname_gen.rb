module Rucc
  class TempnameGen
    def initialize
      @id = 0  # [Integer]
    end

    # @return [String]
    def next
      tempname = ".T#{@id}"
      @id += 1
      tempname
    end
  end
end
