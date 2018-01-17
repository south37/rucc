module Rucc
  # RMap -- Map with recursive search
  class RMap
    # @param [RMap, NilClass] parent
    def initialize(parent = nil)
      @parent = parent
      @hash = {}
    end

    def [](k)
      v = @hash[k]
      if v.nil? && !@parent.nil?
        v = @parent[k]
      end
      v
    end

    def []=(k, v)
      @hash[k] = v
    end
  end
end
