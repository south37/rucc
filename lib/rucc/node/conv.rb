module Rucc
  class Node
    #
    # Type conversion
    #
    module Conv
      # @param [Node] node
      # @return [Node]
      def conv(node)
        return nil if node.nil?

        ty = node.ty
        case ty.kind
        when Kind::ARRAY
          # C11 6.3.2.1p3: An array of T is converted to a pointer to T.
          return Node.ast_uop(AST::CONV, Type.make_ptr_type(ty.ptr), node)
        when Kind::FUNC
          # C11 6.3.2.1p4: A function designator is converted to a pointer to the function.
          return Node.ast_uop(AST::ADDR, Type.make_ptr_type(ty), node)
        when Kind::SHORT, Kind::CHAR, Kind::BOOL
          # C11 6.3.1.1p2: The integer promotions
          return Node.ast_conv(Type::INT, node)
        when Kind::INT
          if !ty.bitsize.nil? && ty.bitsize > 0
            return Node.ast_conv(Type::INT, node)
          end
        end

        node
      end
    end
  end
end
