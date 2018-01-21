module Rucc
  class Parser
    module Do

    private

      # @return [Node]
      def read_do_stmt
        b = @label_gen.next
        e = @label_gen.next
        body = nil
        with_jump_labels(b, e) { body = read_stmt }
        tok = get
        if !Token.is_keyword?(tok, K::WHILE)
          Util.errort!(tok, "'while' is expected, but got #{tok}")
        end
        expect!('(')
        cond = read_boolean_expr
        expect!(')')
        expect!(';')

        v = []
        v.push(Node.ast_dest(b))
        if body
          v.push(body)
        end
        v.push(Node.ast_if(cond, Node.ast_jump(b), nil))
        v.push(Node.ast_dest(e))
        Node.ast_compound_stmt(v)
      end
    end
  end
end
