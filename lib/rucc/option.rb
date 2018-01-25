require "optparse"

module Rucc
  class Option
    def initialize
      @include_path = []
      @dumpasm = false
      @dontlink = false
      @outfile = nil
    end
    attr_reader :include_path, :dumpasm, :dontlink, :outfile

    def parse!(argv)
      opt = OptionParser.new
      opt.on('-I include_path') do |v|
        @include_path.push v
      end
      opt.on('-S') do
        @dumpasm = true
      end
      opt.on('-c') do
        @dontlink = true
      end
      opt.on('-o outputfile') do |v|
        @outfile = v
      end
      opt.parse!(argv)
    end
  end
end
