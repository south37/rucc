require "rucc/m"

module Rucc
  class Macro
    # @param [M] kind
    # @param [<Token>] body
    # @param [Integer] nargs
    # @param [Boolean] is_varg
    # @param [Proc] fn used only for special macro
    def initialize(kind,
                   body: nil,
                   nargs: nil,
                   is_varg: nil,
                   fn: nil
                  )
      @kind = kind
      @body = body
      @nargs = nargs
      @is_varg = is_varg
      @fn = fn
    end
    attr_reader :kind, :body, :nargs, :is_varg, :fn
  end
end
