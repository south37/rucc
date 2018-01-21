module Rucc
  class Parser
    module Goto

    private

      # @return [Node]
      def read_goto_stmt
        if next_token?('*')
          # [GNU] computed goto. "goto *p" jumps to the address pointed by p.
          tok = peek
          expr = read_cast_expr
          if expr.ty.kind != Kind::PTR
            Util.errort!(tok, "pointer expected for computed goto, but got #{expr}")
          end
          return Node.ast_computed_goto(expr)
        end
        tok = get
        if !tok || (tok.kind != T::IDENT)
          Util.errort!(tok, "identifier expected, but got #{tok}")
        end
        expect!(';')
        r = Node.ast_goto(tok.sval)
        @gotos.push(r)
        r
      end
    end
  end
end
