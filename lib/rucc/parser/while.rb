module Rucc
  class Parser
    module While

    private

      # @param [Token] tok
      # @return [Node]
      def read_while_stmt
        expect!('(')
        cond = read_boolean_expr
        expect!(')')

        b = @label_gen.next
        e = @label_gen.next

        body = nil  # declaration for ruby
        with_jump_labels(b, e) { body = read_stmt }

        v = []
        v.push(Node.ast_dest(b))
        v.push(Node.ast_if(cond, body, Node.ast_jump(e)))
        v.push(Node.ast_jump(b))
        v.push(Node.ast_dest(e))
        Node.ast_compound_stmt(v)
      end
    end
  end
end
