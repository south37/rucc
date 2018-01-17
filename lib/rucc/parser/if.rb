module Rucc
  class Parser
    module If
    private
      def read_if_stmt
        expect!('(')
        cond = read_boolean_expr
        expect!(')')
        thn = read_stmt
        if !next_token?(K::ELSE)
          return Node.ast_if(cond, thn, nil)
        end
        els = read_stmt
        Node.ast_if(cond, thn, els)
      end

      def read_boolean_expr
        cond = read_expr
        Type.is_flotype(cond.ty) ? Node.ast_conv(Type::BOOL, cond) : cond
      end
    end
  end
end
