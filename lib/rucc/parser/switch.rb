require "rucc/case"

module Rucc
  class Parser
    module Switch

    private

      # @return [Node]
      def read_switch_stmt
        expect!('(')
        expr = Node.conv(read_expr)
        ensure_inttype!(expr)
        expect!(')')

        e = @label_gen.next
        v = []
        with_switch_context(e) do
          body = read_stmt
          var = Node.ast_lvar(expr.ty, @tempname_gen.next, @localenv, @localvars)
          v.push(Node.ast_binop(expr.ty, '=', var, expr))
          @cases.each do |c|
            v.push(make_switch_jump(var, c))
          end
          v.push(Node.ast_jump(@defaultcase ? @defaultcase : e))
          if body
            v.push(body)
          end
          v.push(Node.ast_dest(e))
        end
        Node.ast_compound_stmt(v)
      end

      def with_switch_context(brk, &block)
        # Set switch context
        ocases       = @cases
        odefaultcase = @defaultcase
        obreak       = @lbreak
        @cases       = []
        @defaultcase = nil
        @lbreak      = brk

        yield

        # Restore switch context
        @cases       = ocases
        @defaultcase = odefaultcase
        @lbreak      = obreak
      end

      # @param [Node] var
      # @param [Case] c
      # @return [Node]
      def make_switch_jump(var, c)
        if c.b == c.e
          cond = Node.ast_binop(Type::INT, OP::EQ, var, Node.ast_inttype(Type::INT, c.b))
        else
          # [GNU] case i ... j is compiled to if (i <= cond && cond <= j) goto <label>.
          x = Node.ast_binop(Type::INT, OP::LE, Node.ast_inttype(Type::INT, c.b), var)
          y = Node.ast_binop(Type::INT, OP::LE, var, Node.ast_inttype(Type::INT, c.e))
          cond = Node.ast_binop(Type::INT, OP::LOGAND, x, y)
        end
        Node.ast_if(cond, Node.ast_jump(c.label), nil)
      end

      # @return [Node]
      def read_case_label(tok)
        if !@cases
          raise "stray case label"
          # errort(tok, "stray case label");
        end
        label = @label_gen.next
        b = read_intexpr
        if next_token?(K::ELLIPSIS)
          e = read_intexpr
          expect!(':')
          if b > e
            raise "case region is not in correct order: #{b} ... #{e}"
            # errort(tok, "case region is not in correct order: %d ... %d", b, e);
          end
          @cases.push(Case.make_case(b, e, label))
        else
          expect!(':')
          @cases.push(Case.make_case(b, b, label))
        end
        check_case_duplicates!
        read_label_tail(Node.ast_dest(label))
      end

      # C11 6.8.4.2p3: No two case constant expressions have the same value.
      def check_case_duplicates!
        len = @cases.size
        x = @cases[len - 1]
        @cases[0..-2].each do |y|
          if (x.e < y.b) || (y.e < x.b)
            next
          end
          if (x.b == x.e)
            raise "duplicate case value: #{x.b}"
            # error("duplicate case value: %d", x->beg)
          end
          raise "duplicate case value: #{x.b} ... #{x.e}"
          # error("duplicate case value: #{x.b} ... #{x.e}")
        end
      end

      # @param [Token] tok
      # @return [Node]
      def read_default_label(tok)
        expect!(':');
        if @defaultcase
          raise "duplicate default"
          # errort(tok, "duplicate default");
        end
        @defaultcase = @label_gen.next
        read_label_tail(Node.ast_dest(@defaultcase))
      end
    end
  end
end
