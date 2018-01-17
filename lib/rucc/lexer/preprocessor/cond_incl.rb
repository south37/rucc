module Rucc
  class Lexer
    class Preprocessor
      module CondInclCtx
        THEN = "CondInclCtx::THEN"
        ELIF = "CondInclCtx::ELIF"
        ELSE = "CondInclCtx::ELSE"
      end

      class CondIncl
        # @param [CondInclCtx]
        # @param [String, NilClass] include_guard
        # @param [FileIO, NilClass] file
        # @param [Boolean] wastrue
        def initialize(ctx, wastrue:)
          @ctx = ctx
          @wastrue = wastrue

          @include_guard = nil
          @file = nil
        end
        attr_reader :ctx, :wastrue, :include_guard, :file
        attr_writer :ctx, :wastrue, :include_guard, :file
      end
    end
  end
end
