require "optparse"

module Rucc
  class Option
    def initialize
      @include_path = []
    end
    attr_reader :include_path

    def parse!(argv)
      opt = OptionParser.new
      opt.on('-I include_path') do |v|
        @include_path.push v
      end
      opt.parse!(argv)
    end
  end
end
