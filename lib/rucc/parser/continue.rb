module Rucc
  class Parser
    module Continue

    private

      # @param [Token] tok
      # @return [Node]
      def read_continue_stmt(tok)
        expect!(';')
        if (!@lcontinue)
          raise "stray continue statement"
          # errort(tok, "stray continue statement")
        end
        Node.ast_jump(@lcontinue)
      end
    end
  end
end
