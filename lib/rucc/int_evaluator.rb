module Rucc
  class IntEvaluator
    class << self
      # @param [Node] node
      # @return [<Integer, (Node, NilClass)>]
      def eval(node)
        i, addr = do_eval(node)

        case i
        when TrueClass
          r = 1
        when FalseClass
          r = 0
        when Integer
          r = i
        else
          raise "Integer expression expected, but got #{node}"
        end

        return r, addr
      end

    private

      # @param [Node] node
      # @return [<Integer, (Node, NilClass)>]
      def do_eval(node)
        case node.kind
        when AST::LITERAL
          if Type.is_inttype(node.ty)
            return [node.ival, nil]
          end
          raise_error(node)
        when '!'
          i, addr = self.eval(node.operand)
          r = (i == 0) ? 1 : 0
          return [r, addr]
        when '~'
          r, addr = self.eval(node.operand)
          return [~r, addr]
        when OP::CAST  then return self.eval(node.operand)
        when AST::CONV then return self.eval(node.operand)
        when AST::ADDR
          if node.operand.kind == AST::STRUCT_REF
            return eval_struct_ref(node.operand, 0)
          end
          return 0, Node.conv(node)
        when AST::GVAR
          return 0, Node.conv(node)
        when AST::DEREF
          if node.operand.ty.kind == Kind::PTR
            return self.eval(node.operand)
          end
          raise_error!(node)
        when AST::TERNARY
          cond, addr = self.eval(node.cond)
          if cond
            return node.thn ? self.eval(node.thn) : [cond, addr]
          end
          return self.eval(node.els)
        when '+'        then return eval_binary_expr(node, &:+)
        when '-'        then return eval_binary_expr(node, &:-)
        when '*'        then return eval_binary_expr(node, &:*)
        when '/'        then return eval_binary_expr(node, &:/)
        when '<'        then return eval_binary_expr(node, &:<)
        when '^'        then return eval_binary_expr(node, &:^)
        when '&'        then return eval_binary_expr(node, &:&)
        when '|'        then return eval_binary_expr(node, &:|)
        when '%'        then return eval_binary_expr(node, &:%)
        when OP::EQ     then return eval_binary_expr(node, &:==)
        when OP::GE     then return eval_binary_expr(node, &:>=)
        when OP::LE     then return eval_binary_expr(node, &:<=)
        when OP::NE     then return eval_binary_expr(node, &:!=)
        when OP::SAL    then return eval_binary_expr(node, &:<<)
        when OP::SAR    then return eval_binary_expr(node, &:>>)
        when OP::SHR    then return eval_binary_expr(node, &:>>)
        when OP::LOGAND then return eval_binary_expr(node) { |a, b| (a != 0) && (b != 0)}  # [Integer] a, [Integer] b
        when OP::LOGOR  then return eval_binary_expr(node) { |a, b| (a != 0) || (b != 0)}  # [Integer] a, [Integer] b
        else
          raise_error(node)
          # error("Integer expression expected, but got %s", node2s(node));
        end
      end

    private

      # @param [Node] node
      def raise_error(node)
        raise "Integer expression expected, but got #{node}"
      end

      # @param [Node] node
      # @return [<Integer, (Node, NilClass)>]
      def eval_binary_expr(node, &block)
        left,  addr_l = self.eval(node.left)
        right, addr_r = self.eval(node.right)
        addr = addr_r || addr_l
        r = yield(left, right)
        return r, addr
      end

      # @param [Node] node
      # @param [Integer] offset
      # @return [<Integer, (Node, NilClass)>]
      def eval_struct_ref(node, offset)
        if node.kind == AST::STRUCT_REF
          return eval_struct_ref(node.struct, node.ty.offset + offset)
        end
        n, addr = self.eval(node)
        return n + offset, addr
      end
    end
  end
end
