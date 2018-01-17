module Rucc
  class Case
    # @param [Integer] b
    # @param [Integer] e
    # @param [String] label
    def initialize(b:, e:, label:)
      @b = b
      @e = e
      @label = label
    end
    attr_reader :b, :e, :label

    class << self
      # @param [Integer] b
      # @param [Integer] e
      # @param [String] label
      def make_case(b, e, label)
        Case.new(b: b, e: e, label: label)
      end
    end
  end
end
