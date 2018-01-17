module Rucc
  class Parser
    module Builtin

    private

      def define_builtin_functions!
        voidptr = [Type.make_ptr_type(Type::VOID)]
        two_voidptrs = [Type.make_ptr_type(Type::VOID), Type.make_ptr_type(Type::VOID)]

        define_builtin! "__builtin_return_address", Type.make_ptr_type(Type::VOID), voidptr
        define_builtin! "__builtin_reg_class",      Type::INT,                      voidptr
        define_builtin! "__builtin_va_arg",         Type::VOID,                     two_voidptrs
        define_builtin! "__builtin_va_start",       Type::VOID,                     voidptr
      end

      # @param [String] name
      # @param [Type] rettype
      # @param [<Type>] paramtypes
      def define_builtin!(name, rettype, paramtypes)
        Node.ast_gvar(Type.make_func_type(rettype, paramtypes, true, false), name, @globalenv)
      end
    end
  end
end
