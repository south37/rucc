module Rucc
  class Parser
    module Ensure

    private

      def ensure_not_void!(ty)
        if ty.kind == Kind::VOID
          raise "void is not allowed"
        end
      end

      # @param [Node] node
      def ensure_lvalue!(node)
        case node.kind
        when AST::LVAR, AST::GVAR, AST::DEREF, AST::STRUCT_REF
          return
        else
          raise "lvalue expected, but got #{node}"
        end
      end

      def ensure_arithtype!(node)
        if !Type.is_arithtype(node.ty)
          raise "arithmetic type expected, but got #{node}"
          # error("arithmetic type expected, but got %s", node2s(node));
        end
      end

      # @param [Node] node
      def ensure_inttype!(node)
        if !Type.is_inttype(node.ty)
          raise "integer type expected, but got #{node}"
          # error("integer type expected, but got %s", node2s(node));
        end
      end
    end
  end
end
