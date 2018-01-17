module Rucc
  class Parser
    module Expr

      # @return [Node]
      def read_expr
        tok = peek
        r = read_comma_expr
        if r.nil?
          raise "#{tok}: expression expected"
          # TODO(south37) Impl errort when necessary
          # errort(tok, "expression expected");
        end
        r
      end

    private

      # @return [Node]
      def read_expr_opt
        read_comma_expr
      end

      # @return [Node]
      def read_comma_expr
        node = read_assignment_expr
        while next_token?(',')
          expr = read_assignment_expr
          node = Node.ast_binop(expr.ty, ',', node, expr)
        end
        node
      end

      def read_assignment_expr
        node = read_logor_expr
        tok = get
        return node if tok.nil?

        if Token.is_keyword?(tok, '?')
          return do_read_conditional_expr(node)
        end
        cop = get_compound_assign_op(tok)
        if Token.is_keyword?(tok, '=') || !cop.nil?
          value = Node.conv(read_assignment_expr)
          if Token.is_keyword?(tok, '=') || !cop.nil?
            ensure_lvalue!(node)
          end
          right = !cop.nil? ? Node.binop(cop, Node.conv(node), value) : value
          if Type.is_arithtype(node.ty) && node.ty.kind != right.ty.kind
            right = Node.ast_conv(node.ty, right)
          end
          return Node.ast_binop(node.ty, '=', node, right)
        end
        @lexer.unget_token(tok)
        node
      end

      # @return [Node]
      def read_conditional_expr
        cond = read_logor_expr
        if !next_token?('?')
          return cond
        end
        do_read_conditional_expr(cond)
      end

      # @param [Node] cond
      # @return [Node]
      def do_read_conditional_expr(cond)
        thn = Node.conv(read_comma_expr)
        expect!(':')
        els = Node.conv(read_conditional_expr)
        # [GNU] Omitting the middle operand is allowed.
        t = thn ? thn.ty : cond.ty
        u = els.ty
        # C11 6.5.15p5: if both types are arithemtic type, the result
        # type is the result of the usual arithmetic conversions.
        if Type.is_arithtype(t) && Type.is_arithtype(u)
          r = Type.usual_arith_conv(t, u)
          Node.ast_ternary(r, cond, (thn ? Node.wrap(r, thn) : nil), Node.wrap(r, els))
        end
        Node.ast_ternary(u, cond, thn, els)
      end

      # @return [Node]
      def read_logor_expr
        node = read_logand_expr
        while next_token?(OP::LOGOR)
          node = Node.ast_binop(Type::INT, OP::LOGOR, node, read_logand_expr)
        end
        node
      end

      # @return [Node]
      def read_logand_expr
        node = read_bitor_expr
        while next_token?(OP::LOGAND)
          node = Node.ast_binop(Type::INT, OP::LOGAND, node, read_bitor_expr)
        end
        node
      end

      # @return [Node]
      def read_bitor_expr
        node = read_bitxor_expr
        while next_token?('|')
          node = Node.binop('|', Node.conv(node), Node.conv(read_bitxor_expr))
        end
        node
      end

      # @return [Node]
      def read_bitxor_expr
        node = read_bitand_expr
        while next_token?('^')
          node = Node.binop('^', Node.conv(node), Node.conv(read_bitand_expr))
        end
        node
      end

      # @return [Node]
      def read_bitand_expr
        node = read_equality_expr
        while next_token?('&')
          node = Node.binop('&', Node.conv(node), Node.conv(read_equality_expr))
        end
        node
      end

      # @return [Node]
      def read_equality_expr
        node = read_relational_expr
        r = nil
        if next_token?(OP::EQ)
          r = Node.binop(OP::EQ, Node.conv(node), Node.conv(read_equality_expr))
        elsif next_token?(OP::NE)
          r = Node.binop(OP::NE, Node.conv(node), Node.conv(read_equality_expr))
        else
          return node
        end
        r.ty = Type::INT
        r
      end

      # @return [Node]
      def read_relational_expr
        node = read_shift_expr
        while true
          if next_token?('<')
            node = Node.binop('<', Node.conv(node), Node.conv(read_shift_expr))
          elsif next_token?('>')
            node = Node.binop('<', Node.conv(read_shift_expr), Node.conv(node))
          elsif next_token?(OP::LE)
            node = Node.binop(OP::LE, Node.conv(node), Node.conv(read_shift_expr))
          elsif next_token?(OP::GE)
            node = Node.binop(OP::LE, Node.conv(read_shift_expr), Node.conv(node))
          else
            return node
          end
          node.ty = Type::INT
        end
        raise "Must not reach here"
      end

      # @return [Node]
      def read_shift_expr
        node = read_additive_expr
        while true
          op = nil
          if next_token?(OP::SAL)
            op = OP::SAL
          elsif next_token?(OP::SAR)
            op = node.ty.usig ? OP::SHR : OP::SAR
          else
            break
          end
          right = read_additive_expr
          ensure_inttype!(node)
          ensure_inttype!(right)
          node = Node.ast_binop(node.ty, op, Node.conv(node), Node.conv(right))
        end
        node
      end

      # @return [Node]
      def read_additive_expr
        node = read_multiplicative_expr
        while true
          if next_token?('+')
            node = Node.binop('+', Node.conv(node), Node.conv(read_multiplicative_expr))
          elsif next_token?('-')
            node = Node.binop('-', Node.conv(node), Node.conv(read_multiplicative_expr))
          else
            return node
          end
        end
        raise "Must not reach here!"
      end

      # @return [Node]
      def read_multiplicative_expr
        node = read_cast_expr
        while true
          if next_token?('*')
            node = Node.binop('*', Node.conv(node), Node.conv(read_cast_expr))
          elsif next_token?('/')
            node = Node.binop('/', Node.conv(node), Node.conv(read_cast_expr))
          elsif next_token?('%')
            node = Node.binop('%', Node.conv(node), Node.conv(read_cast_expr))
          else
            return node
          end
        end
        raise "Must not reach here!"
      end

      # @return [Node]
      def read_cast_expr
        tok = get
        if Token.is_keyword?(tok, '(') && is_type?(peek)
          ty = read_cast_type
          expect!(')')
          if Token.is_keyword?(peek, '{')
            node = read_compound_literal(ty)
            return read_postfix_expr_tail(node)
          end
          return Node.ast_uop(OP::CAST, ty, read_cast_expr)
        end
        @lexer.unget_token(tok)
        read_unary_expr
      end

      # @return [Type]
      def read_cast_type
        ty, _ = read_decl_spec
        read_abstract_declarator(ty)
      end

      # C11 6.7.7: Type names
      # read_abstract_declarator reads a type name.
      # A type name is a declaration that omits the identifier.
      # A few examples are int* (pointer to int), int() (function returning int),
      # int*() (function returning pointer to int),
      # or int(*)() (pointer to funct$an returning int). Used for casting.
      #
      # @param [Type] basety
      # @return [Type]
      def read_abstract_declarator(basety)
        read_declarator("", basety, [], DECL::CAST)
      end

      # @return [Node]
      def read_unary_expr
        tok = get
        if tok.kind == T::KEYWORD
          case tok.id
          when K::SIZEOF  then return read_sizeof_operand
          when K::ALIGNOF then return read_alignof_operand
          when OP::INC    then return read_unary_incdec(OP::PRE_INC)
          when OP::DEC    then return read_unary_incdec(OP::PRE_DEC)
          when OP::LOGAND then return read_label_addr(tok)
          when '&'        then return read_unary_addr
          when '*'        then return read_unary_deref(tok)
          when '+'        then return read_cast_expr
          when '-'        then return read_unary_minus
          when '~'        then return read_unary_bitnot(tok)
          when '!'        then return read_unary_lognot
          end
        end
        @lexer.unget_token(tok)
        read_postfix_expr
      end

      # @return [Node]
      def read_unary_minus
        expr = read_cast_expr
        ensure_arithtype!(expr)
        if Type.is_inttype(expr.ty)
          return Node.binop('-', Node.conv(Node.ast_inttype(expr.ty, 0)), Node.conv(expr))
        end
        Node.binop('-', Node.ast_floattype(expr.ty, 0), expr)
      end

      # @param [Token] tok
      # @return [Node]
      def read_unary_bitnot(tok)
        operand = read_cast_expr
        operand = Node.conv(operand)
        if !Type.is_inttype(operand.ty)
          raise "invalid use of ~: #{operand}"
          # errort(tok, "invalid use of ~: %s", node2s(expr));
        end
        Node.ast_uop('~', operand.ty, operand)
      end

      # @return [Node]
      def read_unary_lognot
        operand = read_cast_expr
        operand = Node.conv(operand)
        Node.ast_uop('!', Type::INT, operand)
      end

      # @return [Node]
      def read_postfix_expr
        node = read_primary_expr
        read_postfix_expr_tail(node)
      end

      # @param [Node] node
      # @return [Node]
      def read_postfix_expr_tail(node)
        return nil if node.nil?

        while true
          if next_token?('(')
            tok = peek
            node = Node.conv(node)
            t = node.ty
            if (t.kind != Kind::PTR) || (t.ptr.kind != Kind::FUNC)
              raise "function expected, but got #{node}"
              # TODO(south37) Impl errot when necessary
              # errort(tok, "function expected, but got %s", node2s(node));
            end
            node = read_funcall(node)
            next
          end

          if next_token?('[')
            node = read_subscript_expr(node)
            next
          end

          if next_token?('.')
            node = read_struct_field(node)
            next
          end

          if next_token?(OP::ARROW)
            if (node.ty.kind != Kind::PTR)
              raise "pointer type expected, but got #{node.ty} #{node}"
            end
            node = Node.ast_uop(AST::DEREF, node.ty.ptr, node)
            node = read_struct_field(node)
            next
          end

          tok = peek
          if next_token?(OP::INC) || next_token?(OP::DEC)
            ensure_lvalue!(node)
            op = Token.is_keyword?(tok, OP::INC) ? OP::POST_INC : OP::POST_DEC
            return Node.ast_uop(op, node.ty, node)
          end

          return node
        end
        raise "Must not reach here!"
      end

      # @param [Node] node
      # @return [Node]
      def read_subscript_expr(node)
        tok = peek
        sub = read_expr
        if !sub
          raise "#{tok}: subscription expected"
          # errort(tok, "subscription expected")
        end
        expect!(']')
        t = Node.binop('+', Node.conv(node), Node.conv(sub))
        Node.ast_uop(AST::DEREF, t.ty.ptr, t)
      end

      # @return [Node]
      def read_primary_expr
        tok = get
        return nil if tok.nil?

        if Token.is_keyword?(tok, '(')
          if next_token?('{')
            return read_stmt_expr
          end
          r = read_expr
          expect!(')')
          return r
        end

        if Token.is_keyword?(tok, K::GENERIC)
          return read_generic
        end

        case tok.kind
        when T::IDENT
          return read_var_or_func(tok.sval)
        when T::NUMBER
          return read_number(tok)
        when T::CHAR
          return Node.ast_inttype(Type.char_type(tok.enc), tok.c)
        when T::STRING
          return Node.ast_string(tok.enc, tok.sval)
        when T::KEYWORD
          @lexer.unget_token(tok)
          return nil
        else
          raise "internal error: unknown token kind: #{tok.kind}"
        end
      end

      # @return [Node]
      def read_stmt_expr
        r = read_compound_stmt
        expect!(')')
        rtype = Type::VOID
        if r.stmts.size > 0
          lastexpr = r.stmts.last
          if lastexpr.ty
            rtype = lastexpr.ty
          end
        end
        r.ty = rtype
        r
      end

      # @param [Token] tok
      # @return [Node]
      def read_label_addr(tok)
        # [GNU] Labels as values. You can get the address of the a label
        # with unary "&&" operator followed by a label name.
        tok2 = get
        if tok2.kind != T::IDENT
          raise "label name expected after &&, but got #{tok2}"
          # errort(tok, "label name expected after &&, but got %s", tok2s(tok2));
        end
        r = Node.ast_label_addr(tok2.sval)
        @gotos.push(r)
        r
      end

      # @return [Node]
      def read_unary_addr
        operand = read_cast_expr
        if operand.kind == AST::FUNCDESG
          return Node.conv(operand)
        end
        ensure_lvalue!(operand)
        Node.ast_uop(AST::ADDR, Type.make_ptr_type(operand.ty), operand)
      end

      # @param [Token] tok
      # @return [Node]
      def read_unary_deref(tok)
        operand = Node.conv(read_cast_expr)
        if operand.ty.kind != Kind::PTR
          raise "pointer type expected, but got #{operand}"
          # TODO(south37) Impl errot when necessary
          # errort(tok, "pointer type expected, but got %s", node2s(operand));
        end
        if operand.ty.ptr.kind == Kind::FUNC
          return operand
        end
        Node.ast_uop(AST::DEREF, operand.ty.ptr, operand)
      end
    end

    # @return [Node]
    def read_sizeof_operand
      ty = read_sizeof_operand_sub
      # Sizeof on void or function type is GNU extension
      size = (ty.kind == Kind::VOID || ty.kind == Kind::FUNC) ? 1 : ty.size
      Util.assert!{ 0 <= size }
      Node.ast_inttype(Type::ULONG, size)
    end

    # @reutrn [Type]
    def read_sizeof_operand_sub
      tok = get
      if Token.is_keyword?(tok, '(') && is_type?(peek)
        r = read_cast_type
        expect!(')')
        return r
      end
      @lexer.unget_token(tok)
      read_unary_expr.ty
    end

    # @return [Node]
    def read_alignof_operand
      expect!('(')
      ty = read_cast_type
      expect!(')')
      Node.ast_inttype(Type::ULONG, ty.align)
    end

    # @param [OP] op
    # @return [Node]
    def read_unary_incdec(op)
      operand = read_unary_expr
      operand = Node.conv(operand)
      ensure_lvalue!(operand)
      Node.ast_uop(op, operand.ty, operand)
    end
  end
end
