module Rucc
  class Parser
    module Func

    private

      # @param [Type] basety
      # @param(return) [Array] params
      # @return [Type]
      def read_declarator_func(basety, params)
        if basety.kind == Kind::FUNC
          raise "function returning a function"
        end
        if basety.kind == Kind::ARRAY
          raise "function returning an array"
        end
        read_func_param_list(params, basety)
      end

      # @param [Array, NilClass] paramvars
      # @param [Type] rettype
      # @return [Type]
      def read_func_param_list(paramvars, rettype)
        # C11 6.7.6.3p10: A parameter list with just "void" specifies that
        # the function has no parameters.
        tok = get
        if Token.is_keyword?(tok, K::VOID) && next_token?(')')
          return Type.make_func_type(rettype, [], false, false)
        end

        # C11 6.7.6.3p14: K&R-style un-prototyped declaration or
        # function definition having no parameters.
        # We return a type representing K&R-style declaration here.
        # If this is actually part of a declartion, the type will be fixed later.
        if Token.is_keyword?(tok, ')')
          return Type.make_func_type(rettype, [], true, true)
        end
        @lexer.unget_token(tok)

        tok2 = peek
        if next_token?(K::ELLIPSIS)
          Util.errort!(tok2, "at least one parameter is required before \"...\"")
        end

        if is_type?(peek)
          paramtypes = []
          ellipsis = read_declarator_params(paramtypes, paramvars)
          return Type.make_func_type(rettype, paramtypes, ellipsis, false)
        end

        if paramvars.nil?
          Util.errort!(tok, "invalid function definition")
        end

        read_declarator_params_oldstyle(paramvars)
        paramtypes = []
        (0..(paramvars.size - 1)).each do
          paramtypes.push Type::INT
        end
        Type.make_func_type(rettype, paramtypes, false, true)
      end

      # @param [Array] types
      # @param [Array] vars
      # @return [Boolean] ellipsis
      def read_declarator_params(types, vars)
        typeonly = vars.nil?
        ellipsis = false
        while true
          tok = peek
          if next_token?(K::ELLIPSIS)
            if types.size == 0
              Util.errort!(tok, "at least one parameter is required before \"...\"")
            end
            expect!(')')
            ellipsis = true
            return ellipsis
          end

          name = ""
          ty = read_func_param(name, typeonly)
          ensure_not_void!(ty)
          types.push(ty)
          if !typeonly
            vars.push(Node.ast_lvar(ty, name, @localenv, @localvars))
          end

          tok = get
          if Token.is_keyword?(tok, ')')
            return ellipsis
          end
          if !Token.is_keyword?(tok, ',')
            Util.errort!(tok, "comma expected, but got #{tok}")
          end
        end
        raise "must not reach here"
      end

      # @param [<String>] name
      # @param [Boolean] optional
      # @return [Type]
      def read_func_param(name, optional)
        basety = Type::INT
        if is_type?(peek)
          basety, _ = read_decl_spec
        elsif optional
          Util.errort!(peek, "type expected, but got #{peek}")
        end
        ty = read_declarator(name, basety, nil, optional ? DECL::PARAM_TYPEONLY : DECL::PARAM)
        # C11 6.7.6.3p7: Array of T is adjusted to pointer to T
        # in a function parameter list.
        if ty.kind == Kind::ARRAY
          return Type.make_ptr_type(ty.ptr)
        end
        # C11 6.7.6.3p8: Function is adjusted to pointer to function
        # in a function parameter list.
        if ty.kind == Kind::FUNC
          return Type.make_ptr_type(ty)
        end
        ty
      end

      # Reads a K&R-style un-prototyped function parameter list.
      #
      # @param [<Node>] vars
      def read_declarator_params_oldstyle(vars)
        while true
          tok = get
          if tok.kind != T::IDENT
            Util.errort!(tok, "identifier expected, but got #{tok}")
          end
          vars.push(Node.ast_lvar(Type::INT, tok.sval, @localenv, @localvars))
          if next_token?(')')
            return
          end
          if !next_token?(',')
            Util.errort!(tok, "comma expected, but got #{get}")
          end
        end
      end

      #
      # Function definition
      #

      # @return [Node]
      def read_funcdef
        basetype, sclass = read_decl_spec_opt
        r = nil

        with_func_context do
          name = ""    # Used as return value
          params = []  # Used as return value
          functype = read_declarator(name, basetype, params, DECL::BODY)
          if functype.oldstyle
            if (params.size == 0)
              functype.hasva = false
            end
            read_oldstyle_param_type(params)
            functype.params = param_types(params)
          end
          functype.isstatic = (sclass == S::STATIC)
          Node.ast_gvar(functype, name, @globalenv)
          expect!('{')
          r = read_func_body(functype, name, params)
          backfill_labels!
        end

        r
      end

      def with_func_context(&block)
        @localenv = RMap.new(@globalenv)
        @gotos = []
        @labels = RMap.new

        yield

        @localenv = nil
        @gotos = nil
        @labels = nil
      end

      # @param(return) [<Node>] params
      def read_oldstyle_param_type(params)
        vars = read_oldstyle_param_args
        update_oldstyle_param_type(params, vars)
      end

      def read_oldstyle_param_args
        orig = @localenv
        @localenv = nil
        r = []
        while true
          if Token.is_keyword?(peek, '{')
            break
          end
          if !is_type?(peek)
            Util.errort!(peek, "K&R-style declarator expected, but got #{peek}")
          end
          read_decl(r, false)
        end
        @localenv = orig
        r
      end

      # @param(return) [Array] params
      # @param [Node] vars
      def update_oldstyle_param_type(params, vars)
        vars.each do |decl|
          Util.assert!{ decl.kind == AST::DECL }
          var = decl.declvar
          Util.assert!{ var.kind == AST::LVAR }
          params.each do |param|
            Util.assert!{ param.kind == AST::LVAR }
            if (param.varname != var.varname)
              next
            end
            param.ty = var.ty
            return  # found
          end
          raise "missing parameter: #{var.varname}"
        end
      end

      def backfill_labels!
        @gotos.each do |src|
          label = src.label
          dest = @labels[label]
          if dest.nil?
            raise "stray #{src.kind == AST::GOTO ? "goto" : "unary &&"}: #{label}"
          end

          if dest.newlabel
            src.newlabel = dest.newlabel
          else
            src.newlabel = dest.newlabel = @label_gen.next
          end
        end
      end

      # @param [Type] functype
      # @param [String] fname
      # @param [Array] params
      # @return [Node]
      def read_func_body(functype, fname, params)
        r = nil

        with_func_body_context(functype) do
          funcname = Node.ast_string(ENC::NONE, fname)
          @localenv["__func__"] = funcname
          @localenv["__FUNCTION__"] = funcname
          body = read_compound_stmt
          r = Node.ast_func(functype, fname, params, body, @localvars)
        end

        r
      end

      # @param [Type] functype
      def with_func_body_context(functype, &block)
        @localenv = RMap.new(@localenv)
        @localvars = []
        @current_func_type = functype

        yield

        @localenv = nil
        @localvars = nil
        @current_func_type = nil
      end
    end
  end
end
