module Rucc
  class LabelGen
    def initialize
      @label_id = 0  # [Integer]
    end

    def next
      label = ".L#{@label_id}"
      @label_id += 1
      label
    end
  end
end
