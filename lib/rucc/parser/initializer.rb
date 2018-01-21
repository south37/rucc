module Rucc
  class Parser
    module Initializer

    private

      # @param [Type] ty
      # @return [Array]
      def read_decl_init(ty)
        r = []
        if Token.is_keyword?(peek, '{') || Type.is_string(ty)
          read_initializer_list(r, ty, 0, false)
        else
          init = Node.conv(read_assignment_expr)
          if Type.is_arithtype(init.ty) && init.ty.kind != ty.kind
            init = Node.ast_conv(ty, init)
          end
          r.push Node.ast_init(init, ty, 0)
        end
        r
      end

      # @param(return) [Array] inits
      # @param [Type] ty
      # @param [Integer] off
      # @param [Boolean] designated
      def read_initializer_list(inits, ty, off, designated)
        tok = get
        if Type.is_string(ty)
          if tok.kind == T::STRING
            assign_string(inits, ty, tok.sval, off)
            return
          end

          if Token.is_keyword?(tok, '{') && (peek.kind == T::STRING)
            tok = get
            assign_string(inits, ty, tok.sval, off)
            expect!('}')
            return
          end
        end
        @lexer.unget_token(tok)
        if ty.kind == Kind::ARRAY
          read_array_initializer(inits, ty, off, designated)
        elsif ty.kind == Kind::STRUCT
          read_struct_initializer(inits, ty, off, designated)
        else
          arraytype = Type.make_array_type(ty, 1)
          read_array_initializer(inits, arraytype, off, designated)
        end
      end

      # @param(return) [Array] inits
      # @param [Type] ty
      # @param [Integer] off
      # @param [Boolean] designated
      def read_array_initializer(inits, ty, off, designated)
        read_array_initializer_sub(inits, ty, off, designated)
        sort_inits!(inits)
      end

      # @param(return) [Array] inits
      # @param(return) [Type] ty
      # @param [Integer] off
      # @param [Boolean] designated
      def read_array_initializer_sub(inits, ty, off, designated)
        has_brace = maybe_read_brace!
        flexible = ty.len <= 0
        elemsize = ty.ptr.size
        i = 0
        while flexible || i < ty.len
          tok = get
          if Token.is_keyword?(tok, '}')
            if !has_brace
              @lexer.unget_token(tok)
            end
            read_array_initializer_type(ty, elemsize, i)
            return
          end
          if (Token.is_keyword?(tok, '.') || Token.is_keyword?(tok, '[')) && !has_brace && !designated
            @lexer.unget_token(tok)
            return
          end
          if Token.is_keyword?(tok, '[')
            tok = peek
            idx = read_intexpr
            if (idx < 0) || (!flexible && ty.len <= idx)
              Util.errort!(tok, "array designator exceeds array bounds: #{idx}")
            end
            i = idx
            expect!(']')
            designated = true
          else
            @lexer.unget_token(tok)
          end
          read_initializer_elem(inits, ty.ptr, off + elemsize * i, designated)
          maybe_skip_comma!
          designated = false
          i += 1
        end
        if has_brace
          skip_to_brace!
        end
        read_array_initializer_type(ty, elemsize, i)
      end

      # @param(return) [Type] ty
      # @param [Integer] elemsize
      # @param [Integer] i
      def read_array_initializer_type(ty, elemsize, i)
        if ty.len < 0
          ty.len = i
          ty.size = elemsize * i
        end
      end

      # @param(return) [Array] inits
      # @param [Type] ty
      # @param [Integer] off
      # @param [Boolean] designated
      def read_struct_initializer(inits, ty, off, designated)
        read_struct_initializer_sub(inits, ty, off, designated)
        sort_inits!(inits)
      end

      # @param(return) [Array] inits
      # @param [Type] ty
      # @param [Integer] off
      # @param [Boolean] designated
      def read_struct_initializer_sub(inits, ty, off, designated)
        has_brace = maybe_read_brace!
        keys = ty.fields.keys
        i = 0
        while true
          tok = get
          if Token.is_keyword?(tok, '}')
            if !has_brace
              @lexer.unget_token(tok)
            end
            return
          end
          if (Token.is_keyword?(tok, '.') || Token.is_keyword?(tok, '[')) && !has_brace && !designated
            @lexer.unget_token(tok)
            return
          end
          if Token.is_keyword?(tok, '.')
            tok = get
            if !tok || (tok.kind != T::IDENT)
              Util.errort!(tok, "malformed desginated initializer: #{tok}")
            end
            fieldname = tok.sval
            fieldtype = ty.fields[fieldname]
            if !fieldtype
              Util.errort!(tok, "field does not exist: #{tok}")
            end
            keys = ty.fields.keys
            i = 0
            while i < keys.size
              s = keys[i]
              i += 1
              if fieldname == s
                break
              end
            end
            designated = true
          else
            @lexer.unget_token(tok)
            if i == keys.size
              break
            end
            fieldname = keys[i]
            i += 1
            fieldtype = ty.fields[fieldname]
          end
          read_initializer_elem(inits, fieldtype, off + fieldtype.offset, designated)
          maybe_skip_comma!
          designated = false
          if !ty.is_struct
            break
          end
        end
        if has_brace
          skip_to_brace!
        end
      end

      # @param(return) [Array] inits
      # @param(return) [Type] ty
      # @param [Integer] off
      # @param [Boolean] designated
      def read_initializer_elem(inits, ty, off, designated)
        next_token?('=')
        if (ty.kind == Kind::ARRAY) || (ty.kind == Kind::STRUCT)
          read_initializer_list(inits, ty, off, designated)
        elsif next_token?('{')
          read_initializer_elem(inits, ty, off, true)
          expect!('}')
        else
          expr = Node.conv(read_assignment_expr)
          Type.ensure_assignable!(ty, expr.ty)
          inits.push(Node.ast_init(expr, ty, off))
        end
      end

      def sort_inits!(inits)
        inits.sort_by! { |init| init.initoff }
      end

      # @return [Boolean]
      def maybe_read_brace!
        next_token?('{')
      end

      def maybe_skip_comma!
        next_token?(',')
      end

      def skip_to_brace!
        while true
          if next_token?('}')
            return
          end
          if next_token?('.')
            get
            expect!('=')
          end
          # tok = peek
          ignore = read_assignment_expr
          return if !ignore
          # TODO(south37) Impl warnt when necessary
          # warnt(tok, "excessive initializer: %s", node2s(ignore));
          maybe_skip_comma!();
        end
      end
    end
  end
end
