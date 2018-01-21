require "rucc/decl"
require "rucc/label_gen"
require "rucc/lexer"
require "rucc/node"
require "rucc/rmap"
require "rucc/s"
require "rucc/static_label_gen"
require "rucc/tempname_gen"
require "rucc/type"
require "rucc/type_info"
require "rucc/int_evaluator"

require "rucc/parser/break"
require "rucc/parser/builtin"
require "rucc/parser/continue"
require "rucc/parser/do"
require "rucc/parser/ensure"
require "rucc/parser/enum"
require "rucc/parser/expr"
require "rucc/parser/for"
require "rucc/parser/func"
require "rucc/parser/func_call"
require "rucc/parser/goto"
require "rucc/parser/if"
require "rucc/parser/initializer"
require "rucc/parser/label"
require "rucc/parser/return"
require "rucc/parser/struct_and_union"
require "rucc/parser/switch"
require "rucc/parser/while"

module Rucc
  class Parser
    include Break
    include Builtin
    include Continue
    include Do
    include Ensure
    include Enum
    include Expr
    include For
    include Func
    include FuncCall
    include Goto
    include If
    include Initializer
    include Label
    include Return
    include StructAndUnion
    include Switch
    include While

    # @param [Lexer] lexer
    # @param [LabelGen] label_gen
    def initialize(lexer, label_gen)
      @lexer = lexer

      @label_gen        = label_gen
      @tempname_gen     = TempnameGen.new
      @static_label_gen = StaticLabelGen.new

      # You can use the same name for global variable, local variable,
      # struct/union/enum tag, and goto label!
      @globalenv = RMap.new  # [RMap]
      @localenv  = nil       # [RMap, NilClass]
      @tags      = RMap.new  # [RMap, NilClass]
      @labels    = nil       # [RMap, NilClass]

      @toplevels = []   # [Array, NilClass]
      @localvars = nil  # [Array, NilClass]
      @gotos     = nil  # [Array, NilClass]
      @cases     = nil  # [Array, NilClass]

      @current_func_type = nil  # [Type, NilClass]

      @defaultcase = nil  # [String, NilClass]
      @lbreak = nil       # [String, NilClass]
      @lcontinue = nil    # [String, NilClass]

      define_builtin_functions!
    end

    def read_toplevels
      while true
        return @toplevels if (peek.kind == T::EOF)

        if is_funcdef?
          @toplevels.push(read_funcdef)
        else
          read_decl(@toplevels, true)
        end
      end
      raise "Must not reach here"
    end

  private

    # @param(return) list
    def read_decl_or_stmt(list)
      tok = peek
      if (tok.kind == T::EOF)
        raise "premature end of input"
      end
      # TODO(south37) Impl mark_location if necessary
      # mark_location();
      if is_type?(tok)
        read_decl(list, false)
      elsif next_token?(K::STATIC_ASSERT)
        read_static_assert
      else
        stmt = read_stmt
        if stmt
          list.push(stmt)
        end
      end
    end

    # @param [Array] block
    # @param [Boolean] isglobal
    # @return [Node]
    def read_decl(block, isglobal)
      basetype, sclass = read_decl_spec_opt
      return if next_token?(';')
      while true
        name = ''
        ty = read_declarator(name, Type.copy_incomplete_type(basetype), nil, DECL::BODY)
        ty.isstatic = (sclass == S::STATIC)
        if (sclass == S::TYPEDEF)
          Node.ast_typedef(ty, name, env)
        elsif ty.isstatic && !isglobal
          ensure_not_void!(ty)
          read_static_local_var(ty, name)
        else
          ensure_not_void!(ty)
          var = (isglobal ? Node.ast_gvar(ty, name, @globalenv) : Node.ast_lvar(ty, name, @localenv, @localvars))
          if next_token?('=')
            block.push Node.ast_decl(var, read_decl_init(ty))
          elsif (sclass != S::EXTERN) && (ty.kind != Kind::FUNC)
            block.push Node.ast_decl(var, nil)
          end
        end

        if next_token?(';')
          return
        end
        if !next_token?(',')
          Util.errort!(peek, "';' or ',' are expected, but got #{peek}")
        end
      end
    end

    def read_static_assert
      expect!('(')
      val = read_intexpr
      expect!(',')
      tok = get
      if tok.kind != T::STRING
        Util.errort!(tok, "string expected as the second argument for _Static_assert, but got #{tok}")
      end
      expect!(')')
      expect!(';')
      if (!val)
        Util.errort!(tok, "_Static_assert failure: #{tok.sval}")
      end
    end

    # @param [Type] ty
    # @param [String] name
    def read_static_local_var(ty, name)
      var = Node.ast_static_lvar(ty, name, @localenv, @static_label_gen.next(name))
      init = nil
      if next_token?('=')
        orig = @localenv
        @localenv = nil
        init = read_decl_init(ty)
        @localenv = orig
      end
      @toplevels.push(Node.ast_decl(var, init))
    end

    # @param [Array] inits
    # @param [Type] ty
    # @param [String] p
    # @param [Integer] off
    def assign_string(inits, ty, p, off)
      return if ty.len == 0
      if ty.len == -1
        # p.size is the size of ruby string. In C, string is terminated with
        # a null byte (\0), so ty.size is p.size + 1.
        ty.len = ty.size = (p.size + 1)
      end
      i = 0
      while (i < ty.len) && (c = p[i])
        inits.push(Node.ast_init(Node.ast_inttype(Type::CHAR, c.ord), Type::CHAR, off + i))
        i += 1
      end
      while (i < ty.len)
        inits.push(Node.ast_init(Node.ast_inttype(Type::CHAR, 0), Type::CHAR, off + i))
        i += 1
      end
    end

    # @return [Node]
    def read_stmt
      tok = get
      if (tok.kind == T::KEYWORD)
        case tok.id
        when '{'         then return read_compound_stmt
        when K::IF       then return read_if_stmt
        when K::FOR      then return read_for_stmt
        when K::WHILE    then return read_while_stmt
        when K::DO       then return read_do_stmt
        when K::RETURN   then return read_return_stmt
        when K::SWITCH   then return read_switch_stmt
        when K::CASE     then return read_case_label(tok)
        when K::DEFAULT  then return read_default_label(tok)
        when K::BREAK    then return read_break_stmt(tok)
        when K::CONTINUE then return read_continue_stmt(tok)
        when K::GOTO     then return read_goto_stmt
        end
      end

      if (tok.kind == T::IDENT) && next_token?(':')
        return read_label(tok)
      end
      @lexer.unget_token(tok)
      r = read_expr_opt
      expect!(';')
      r
    end

    # @return [Node]
    def read_compound_stmt
      orig = @localenv
      @localenv = RMap.new(@localenv)
      list = []
      while true
        if next_token?('}')
          break
        end
        read_decl_or_stmt(list)
      end
      @localenv = orig
      Node.ast_compound_stmt(list)
    end

    # TODO(south37) Impl
    # @return [Node]
    def read_generic
      raise "_Generic is not supported!"
    end

    # @param [Token] tok
    def read_number(tok)
      s = tok.sval
      isfloat =
        (s.include?(".".freeze) || s.include?("p".freeze) || s.include?("P".freeze)) ||
        (
          (s[0..1].downcase != "0x") &&
          (s.include?("e".freeze) || s.include?("E".freeze))
        )
      isfloat ? read_float(tok) : read_int(tok)
    end

    # @param [String] s
    # @return [<Type, Integer>]
    def read_int_suffix(s)
      if (s.size > 3) && (s[-3..-1].downcase == "ull" || s[-3..-1].downcase == "llu")
        return Type::ULLONG, 3
      end

      if (s.size > 2) && (s[-2..-1].downcase == "ul" || s[-2..-1].downcase == "lu")
        return Type::ULONG, 2
      end

      if (s.size > 2) && (s[-2..-1].downcase == "ll")
        return Type::LLONG, 2
      end

      if (s.size > 1) && (s[-1].downcase == "u")
        return Type::UINT, 1
      end

      if (s.size > 1) && (s[-1].downcase == "l")
        return Type::LONG, 1
      end

      return nil, 0
    end

    INT_MAX  = 2 ** 31 - 1  # Max of int
    UINT_MAX = 2 ** 32 - 1  # Max of uint
    LONG_MAX = 2 ** 63 - 1  # Max of long

    # @param [s]
    # @return [Integer]
    def read_int_sval(s)
      s = s.downcase
      if s.match(/^[+-]?0x/)
        return s.to_i(16)
      end
      if s.match(/^[+-]?0b/)
        return s.to_i(2)
      end
      if s.match(/^[+-]?0/)
        return s.to_i(8)
      end
      s.to_i(10)
    end

    # @param [Token] tok
    # @return [Node]
    def read_int(tok)
      s = tok.sval

      ty, suf_size = read_int_suffix(s)
      s = s[0..-(suf_size + 1)]

      # TODO(south37) Use strtoul instead of original impl for compatibility with C
      v = read_int_sval(s)
      # if (*end != '\0')
      #     errort(tok, "invalid character '%c': %s", *end, s);

      if ty
        return Node.ast_inttype(ty, v)
      end

      # C11 6.4.4.1p5: Decimal constant type is int, long, or long long.
      # In 8cc, long and long long are the same size.
      base10 = (s[0] != '0')
      if base10
        if (v & ~INT_MAX) == 0
          ty = Type::INT
        else
          ty = Type::LONG
        end
        return Node.ast_inttype(ty, v)
      end

      # Octal or hexadecimal constant type may be unsigned.
      ty =
        if (v & ~INT_MAX) == 0
          Type::INT
        elsif (v & ~UINT_MAX) == 0
          Type::UINT
        elsif (v & ~LONG_MAX) == 0
          Type::LONG
        else  # TODO(south37) Check for value is in ulong
          Type::ULONG
        end
      Node.ast_inttype(ty, v)
    end

    def read_float(tok)
      s = tok.sval

      # TODO(sotuh37) Impl strtod in Ruby. Use strtod instead of String#to_f
      # double v = strtod(s, &end);
      # if (*end != '\0')
      #     errort(tok, "invalid character '%c': %s", *end, s);

      val = read_float_sval(s)

      # C11 6.4.4.2p4: The default type for flonum is double.
      if s[-1].downcase == "l"
        type = Type::LDOUBLE
        s = s[0..-2]
      elsif s[-1].downcase == "f"
        type = Type::FLOAT
        s = s[0..-2]
      else
        type = Type::DOUBLE
      end

      return Node.ast_floattype(type, val)
    end

    # @param [String] s
    # @param [Symbol] sign
    # @return [Float]
    def read_float_sval(s)
      if s[0..1].downcase == "0x"
        if s.include?("p") || s.include?("P")
          sign, exp = s.split(/[pP]/)
          if sign.include?('.')
            l, r = sign.split('.')
            v = (l + r).to_i(16).to_f / (16 ** r.size)
          else
            v = sign.to_i(16).to_f
          end
          v * (2 ** exp.to_i)
        else
          s.to_i(16).to_f
        end
      else
        s.to_f
      end
    end

    # @return [Integer]
    def read_intexpr
      i, _ = IntEvaluator.eval(read_conditional_expr)
      i
    end

    # @param [String] name
    # @return [Node]
    def read_var_or_func(name)
      v = env[name]
      if v.nil?
        tok = peek
        if !Token.is_keyword?(tok, '(')
          Util.errort!(tok, "undefined variable: #{name}")
        end
        ty = Type.make_func_type(Type::INT, [], true, false)
        # TODO(south37) Impl want when necessary
        # warnt(tok, "assume returning int: %s()", name);
        return Node.ast_funcdesg(ty, name)
      end
      if v.ty.kind == Kind::FUNC
        return Node.ast_funcdesg(v.ty, name)
      end
      v
    end

    # @param [Token] tok
    # @return [String, OP, NilClass]
    def get_compound_assign_op(tok)
      if tok.kind != T::KEYWORD
        return nil
      end

      case tok.id
      when OP::A_ADD then return '+'
      when OP::A_SUB then return '-'
      when OP::A_MUL then return '*'
      when OP::A_DIV then return '/'
      when OP::A_MOD then return '%'
      when OP::A_AND then return '&'
      when OP::A_OR  then return '|'
      when OP::A_XOR then return '^'
      when OP::A_SAL then return OP::SAL
      when OP::A_SAR then return OP::SAR
      when OP::A_SHR then return OP::SHR
      else                return nil
      end
    end

    # @param [String] name
    # @return [Type, nil]
    def get_typedef(name)
      node = env[name]
      if node && (node.kind == AST::TYPEDEF)
        node.ty
      else
        nil
      end
    end

    # @param [Token] tok
    def is_type?(tok)
      return get_typedef(tok.sval) if tok.kind == T::IDENT
      return false                 if tok.kind != T::KEYWORD
      return tok.id.is_type?       if tok.id.is_a?(Keyword)
      false
    end

    #
    # Declarator
    #
    # C's syntax for declaration is not only hard to read for humans but also
    # hard to parse for hand-written parsers. Consider the following two cases:
    #
    #   A: int *x;
    #   B: int *x();
    #
    # A is of type pointer to int, but B is not a pointer type, B is type of
    # function returning a pointer to an integer. The meaning of the first half
    # of the declaration ("int *" part) is different between them.
    #
    # In 8cc, delcarations are parsed by two functions: read_declarator
    # and read_declarator_tail. The former function parses the first half of a
    # declaration, and the latter parses the (possibly nonexistent) parentheses
    # of a function or an array.
    #

    # C11 6.7.6: Declarators
    # TODO(south37) Use return value for rname, params
    # @param(return) [String] rname used as return value
    # @param [Type] basety
    # @param(return) [Array] params
    # @param [DECL] ctx
    # @return [Type]
    def read_declarator(rname, basety, params, ctx)
      if next_token?('(')
        # '(' is either beginning of grouping parentheses or of a function parameter list.
        # If the next token is a type name, a parameter list must follow.
        if is_type?(peek)
          return read_declarator_func(basety, params)
        end

        # If not, it's grouping. In that case we have to read from outside.
        # For example, consider int (*)(), which is "pointer to function returning int".
        # We have only read "int" so far. We don't want to pass "int" to
        # a recursive call, or otherwise we would get "pointer to int".
        # Here, we pass a dummy object to get "pointer to <something>" first,
        # continue reading to get "function returning int", and then combine them.
        stub = Type.make_stub_type
        t = read_declarator(rname, stub, params, ctx)
        expect!(')')
        stub.replace_by!(read_declarator_tail(basety, params))
        return t
      end

      if next_token?('*')
        skip_type_qualifiers!
        return read_declarator(rname, Type.make_ptr_type(basety), params, ctx)
      end

      tok = get
      if tok.kind == T::IDENT
        if ctx == DECL::CAST
          Util.errort!(tok, "identifier is not expected, but got #{tok}")
        end
        rname << tok.sval  # Write as return value
        return read_declarator_tail(basety, params)
      end

      if [DECL::BODY, DECL::PARAM].include?(ctx)
        Util.errort!(tok, "identifier, ( or * are expected, but got #{tok}")
      end
      @lexer.unget_token(tok)
      read_declarator_tail(basety, params)
    end

    # @param [TypeInfo] kind
    # @param [TypeInfo] size
    # @param [TypeInfo] sig
    # @param [] usertype
    # @return [Boolean]
    def error_check(kind, size, sig, usertype)
      if (kind == TypeInfo::BOOL) && size && sig
        return false
      end

      if (size == TypeInfo::SHORT) && kind && (kind != Type::INT)
        return false
      end

      if (size == TypeInfo::LONG) && kind && (kind != TypeInfo::INT) && (kind != TypeInfo::DOUBLE)
        return false
      end

      if sig && [TypeInfo::VOID, TypeInfo::FLOAT, TypeInfo::DOUBLE].include?(kind)
        return false
      end

      if usertype
        if kind || size || sig
          return false
        end
      end
      true
    end

    # @raise [RuntimeError]
    def read_decl_spec_error!(tok)
      Util.errort!(tok, "type name expected, but got #{tok}")
    end

    # @return [<Type, S>]
    def read_decl_spec
      sclass = nil
      tok = peek
      if !is_type?(tok)
        read_decl_spec_error!(tok)
      end

      usertype = nil
      kind = nil
      size = nil
      sig  = nil
      align = -1

      while true
        tok = get
        if tok.kind == T::EOF
          read_decl_spec_error!(tok)
        end
        if kind.nil? && (tok.kind == T::IDENT) && !usertype
          typedef = get_typedef(tok.sval)
          if typedef
            if usertype
              read_decl_spec_error!(tok)
            end
            usertype = typedef
            if error_check(kind, size, sig, usertype)
              next
            else
              read_decl_spec_error!(tok)
            end
          end
        end

        if tok.kind != T::KEYWORD
          @lexer.unget_token(tok)
          break
        end

        case tok.id
        when K::TYPEDEF
          if sclass then read_decl_spec_error!(tok) else sclass = S::TYPEDEF  end
        when K::EXTERN
          if sclass then read_decl_spec_error!(tok) else sclass = S::EXTERN   end
        when K::STATIC
          if sclass then read_decl_spec_error!(tok) else sclass = S::STATIC   end
        when K::AUTO
          if sclass then read_decl_spec_error!(tok) else sclass = S::AUTO     end
        when K::REGISTER
          if sclass then read_decl_spec_error!(tok) else sclass = S::REGISTER end
        when K::CONST
          # Do nothing
        when K::VOLATILE
          # Do nothing
        when K::INLINE
          # Do nothing
        when K::NORETURN
          # Do nothing
        when K::VOID
          if kind then read_decl_spec_error!(tok) else kind = TypeInfo::VOID   end
        when K::BOOL
          if kind then read_decl_spec_error!(tok) else kind = TypeInfo::BOOL   end
        when K::CHAR
          if kind then read_decl_spec_error!(tok) else kind = TypeInfo::CHAR   end
        when K::INT
          if kind then read_decl_spec_error!(tok) else kind = TypeInfo::INT    end
        when K::FLOAT
          if kind then read_decl_spec_error!(tok) else kind = TypeInfo::FLOAT  end
        when K::DOUBLE
          if kind then read_decl_spec_error!(tok) else kind = TypeInfo::DOUBLE end
        when K::SIGNED
          if sig then read_decl_spec_error!(tok) else sig = TypeInfo::SIGNED   end
        when K::UNSIGNED
          if sig then read_decl_spec_error!(tok) else sig = TypeInfo::UNSIGNED end
        when K::SHORT
          if size then read_decl_spec_error!(tok) else size = TypeInfo::SHORT  end
        when K::STRUCT
          if usertype then read_decl_spec_error!(tok) else usertype = read_struct_def end
        when K::UNION
          if usertype then read_decl_spec_error!(tok) else usertype = read_union_def  end
        when K::ENUM
          if usertype then read_decl_spec_error!(tok) else usertype = read_enum_def   end
        when K::ALIGNAS
          val = read_alignas
          if val < 0
            Util.errort!(tok, "negative alignment: #{val}")
          end

          if val == 0
            if error_check(kind, size, sig, usertype)
              next
            end
          end

          if (align == -1) || (val < align)
            align = val
          end
        when K::LONG
          if size.nil?
            size = TypeInfo::LONG
          elsif (size == TypeInfo::LONG)
            size = TypeInfo::LLONG
          else
            read_decl_spec_error!(tok)
          end
        when K::TYPEOF
          if usertype
            read_decl_spec_error!(tok)
          end
          usertype = read_typeof
        else
          @lexer.unget_token(tok)
          break  # Stop loop
        end

        # NOTE: check error before next loop
        error_check(kind, size, sig, usertype)
      end

      if usertype
        return usertype, sclass
      end
      if (align != -1) && !is_peweroftwo?(align)
        Util.errort!(tok, "alignment must be power of 2, but got #{align}")
      end

      ty = nil
      case kind
      when TypeInfo::VOID
        ty = Type::VOID
      when TypeInfo::BOOL
        ty = Type.make_numtype(Kind::BOOL, false)
      when TypeInfo::CHAR
        ty = Type.make_numtype(Kind::CHAR, sig == TypeInfo::UNSIGNED)
      when TypeInfo::FLOAT
        ty = Type.make_numtype(Kind::FLOAT, false)
      when TypeInfo::DOUBLE
        ty = Type.make_numtype(((size == TypeInfo::LONG) ? Kind::LDOUBLE : Kind::DOUBLE), false)
      else
        # Do nothing
      end

      if ty
        ty.align = align if (align != -1)
        return ty, sclass
      end

      case size
      when TypeInfo::SHORT
        ty = Type.make_numtype(Kind::SHORT, sig == TypeInfo::UNSIGNED)
      when TypeInfo::LONG
        ty = Type.make_numtype(Kind::LONG, sig == TypeInfo::UNSIGNED)
      when TypeInfo::LLONG
        ty = Type.make_numtype(Kind::LLONG, sig == TypeInfo::UNSIGNED)
      else
        ty = Type.make_numtype(Kind::INT, sig == TypeInfo::UNSIGNED)
      end

      ty.align = align if (align != -1)
      return ty, sclass
    end

    # @return [<Type, S>]
    def read_decl_spec_opt
      if is_type?(peek)
        return read_decl_spec
      end
      # TODO(south37) Impl warnt
      # warnt(peek(), "type specifier missing, assuming int");
      return Type::INT, nil
    end

    # @param [Type] basety
    # @return [Type]
    def read_declarator_array(basety)
      if next_token?(']')
        len = -1
      else
        len = read_intexpr
        expect!(']')
      end
      tok = peek
      t = read_declarator_tail(basety, nil)
      if t.kind == Kind::FUNC
        Util.errort!(tok, "array of functions")
      end
      Type.make_array_type(t, len)
    end

    # @param [Type] basety
    # @param(return) [Array] params
    # @return [Type]
    def read_declarator_tail(basety, params)
      if next_token?('[')
        return read_declarator_array(basety)
      end
      if next_token?('(')
        return read_declarator_func(basety, params)
      end
      return basety
    end

    def skip_type_qualifiers!
      while (next_token?(K::CONST) || next_token?(K::VOLATILE) || next_token?(K::RESTRICT))
        # Do nothing
      end
    end

    # @return [Array]
    # @param [<Node>] params
    # @return [<Type>]
    def param_types(params)
      params.map(&:ty)
    end

    # @return [Integer]
    def read_alignas
      # C11 6.7.5. Valid form of _Alignof is either _Alignas(type-name) or
      # _Alignas(constant-expression).
      expect!('(')
      r = is_type?(peek) ? read_cast_type.align : read_intexpr
      expect!(')')
      r
    end

    # @return [Type]
    def read_typeof
      expect!('(')
      r = is_type?(peek) ? read_cast_type : read_comma_expr.ty
      expect!(')')
      r
    end

    # @param [Type] ty
    # @return [Node]
    def read_compound_literal(ty)
      name = @label_gen.next
      init = read_decl_init(ty)
      r = Node.ast_lvar(ty, name, @localenv, @localvars)
      r.lvarinit = init
      r
    end

    # TODO(south37) Improve performance by cache.
    # is_funcdef? returns true if we are at beginning of a function definition.
    # The basic idea is that if we see '{' or a type keyword after a closing
    # parenthesis of a function parameter list, we were reading a function
    # definition. (Usually '{' comes after a closing parenthesis.
    # A type keyword is allowed for K&R-style function definitions.)
    def is_funcdef?
      buf = []
      r = false
      while true
        tok = get
        buf.push(tok)

        # Early return
        raise "premature end of input" if tok.kind == T::EOF
        if Token.is_keyword?(tok, ';')
          break
        end
        if is_type?(tok)
          next
        end
        if Token.is_keyword?(tok, '(')
          skip_parentheses!(buf)
          next
        end

        # Check if function definition
        if tok.kind != T::IDENT
          next
        end
        if !Token.is_keyword?(peek, '(')
          next
        end
        buf.push(get)
        skip_parentheses!(buf)

        # (Usually '{' comes after a closing parenthesis.
        # A type keyword is allowed for K&R-style function definitions.
        r = (Token.is_keyword?(peek, '{') || is_type?(peek))
        break
      end

      while buf.size > 0
        @lexer.unget_token(buf.pop)
      end
      r
    end

    def skip_parentheses!(buf)
      while true
        tok = get
        if tok.kind == T::EOF
          raise "premature end of input"
        end
        buf.push(tok)
        if Token.is_keyword?(tok, ')')
          return
        end
        if Token.is_keyword?(tok, '(')
          skip_parentheses!(buf)
        end
      end
      raise "Must not reach here!"
    end

    # @param [Token] tok
    def concatenate_string(tok)
      enc = tok.enc
      b = tok.sval.dup
      while (peek.kind == T::STRING)
        tok2 = @lexer.read_token
        b << tok2.sval
        enc2 = tok2.enc
        if (enc != ENC::NONE) && (enc2 != ENC::NONE) && (enc != enc2)
          Util.errort!(tok2, "unsupported non-standard concatenation of string literals: #{tok2}")
        end
        if enc == ENC::NONE
          enc = enc2
        end
      end
      tok.sval = b
      tok.enc = enc
    end

    # @param [Integer] x
    # @return [Boolean]
    def is_peweroftwo?(x)
      if x > 0
        # If there's only one bit set in x, the value is a power of 2.
        (x & (x - 1)) == 0
      else
        false
      end
    end

    def env
      @localenv.nil? ? @globalenv : @localenv
    end

    # @param [String] kind
    # @return [Boolean]
    def next_token?(kind)
      tok = get_internal
      if Token.is_keyword?(tok, kind)
        return true
      end
      @lexer.unget_token(tok)
      return false
    end

    # Consume and print for debug
    #
    # @return [Token]
    def get
      tok = get_internal
      # NOTE: Only for debug
      # print "#{tok} #{tok.file&.name || "(unknown)"} #{tok.line} #{tok.column}\n"
      tok
    end

    # @return [Token]
    def get_internal
      r = @lexer.read_token
      if r.kind == T::INVALID
        Util.errort!(r, "stray character in program: '#{r.c}'")
      end
      if r.kind == T::STRING && peek.kind == T::STRING
        concatenate_string(r)
      end
      r
    end

    # @return [Token]
    def peek
      @lexer.peek_token
    end

    # @param [String] id
    def expect!(id)
      tok = get
      if !Token.is_keyword?(tok, id)
        Util.errort!(tok, "'#{id}' expected, but got #{tok}")
      end
    end
  end
end
