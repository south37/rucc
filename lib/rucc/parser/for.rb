module Rucc
  class Parser
    module For
      private
      # @return [Node]
      def read_for_stmt
        expect!('(')
        beg = @label_gen.next
        mid = @label_gen.next
        lst = @label_gen.next

        orig = @localenv
        @localenv = RMap.new(@localenv)
        init = read_opt_decl_or_stmt
        cond = read_expr_opt
        if cond && Type.is_flotype(cond.ty)
          cond = Node.ast_conv(Type::BOOL, cond)
        end
        expect!(';')
        step = read_expr_opt
        expect!(')')
        body = nil  # declaration for ruby
        with_jump_labels(mid, lst) { body = read_stmt }
        @localenv = orig

        v = []
        if !init.nil?
          v.push(init)
        end
        v.push(Node.ast_dest(beg))
        if !cond.nil?
          v.push(Node.ast_if(cond, nil, Node.ast_jump(lst)))
        end
        if !body.nil?
          v.push(body)
        end
        v.push(Node.ast_dest(mid))
        if !step.nil?
          v.push(step)
        end
        v.push(Node.ast_jump(beg))
        v.push(Node.ast_dest(lst))
        Node.ast_compound_stmt(v)
      end

      # @param [String] cont
      # @param [String] brk
      def with_jump_labels(cont, brk)
        # Set jump lablels
        ocontinue = @lcontinue
        obreak    = @lbreak
        @lcontinue = cont
        @lbreak    = brk

        yield

        # Restore jump lablels
        @lcontinue = ocontinue
        @lbreak    = obreak
      end

      # @return [Node, NilClass]
      def read_opt_decl_or_stmt
        return nil if next_token?(';')
        list = []
        read_decl_or_stmt(list)
        Node.ast_compound_stmt(list)
      end
    end
  end
end
