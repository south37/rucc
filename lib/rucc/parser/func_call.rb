module Rucc
  class Parser
    module FuncCall

    private

      # @param [Node] fp
      def read_funcall(fp)
        if (fp.kind == AST::ADDR) && (fp.operand.kind == AST::FUNCDESG)
          desg = fp.operand
          args = read_func_args(desg.ty.params)
          return Node.ast_funcall(desg.ty, desg.fname, args)
        end
        args = read_func_args(fp.ty.ptr.params)
        Node.ast_funcptr_call(fp, args)
      end

      # @param [Array] params
      # @return [Array]
      def read_func_args(params)
        args = []
        i = 0
        while true
          break if next_token?(')')
          arg = Node.conv(read_assignment_expr)
          if i < params.size
            paramtype = params[i]
            i += 1
          else
            paramtype =
              if Type.is_flotype(arg.ty)
                Type::DOUBLE
              elsif Type.is_inttype(arg.ty)
                Type::INT
              else
                arg.ty
              end
          end
          Type.ensure_assignable!(paramtype, arg.ty)
          if paramtype.kind != arg.ty.kind
            arg = Node.ast_conv(paramtype, arg)
          end
          args.push(arg)
          tok = get
          break if Token.is_keyword?(tok, ')')
          if !Token.is_keyword?(tok, ',')
            raise "unexpected token: '#{tok}'"
            # TODO(south37) Impl errort when necessary
            # errort(tok, "unexpected token: '%s'", tok2s(tok));
          end
        end
        args
      end
    end
  end
end
