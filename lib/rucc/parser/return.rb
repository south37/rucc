module Rucc
  class Parser
    module Return
      private

      def read_return_stmt
        retval = read_expr_opt
        expect!(';')
        if !retval.nil?
          return Node.ast_return(Node.ast_conv(@current_func_type.rettype, retval))
        end
        Node.ast_return(nil)
      end
    end
  end
end
