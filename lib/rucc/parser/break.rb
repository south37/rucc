module Rucc
  class Parser
    module Break

    private

      # @param [Token] tok
      # @return [Node]
      def read_break_stmt(tok)
        expect!(';')
        if !@lbreak
          raise "stray break statement"
          # errort(tok, "stray break statement");
        end
        Node.ast_jump(@lbreak)
      end
    end
  end
end
