module Rucc
  class Lexer
    class Preprocessor
      module Constructor
        # @param [String] name
        # @param [Token] value
        def define_obj_macro(name, value)
          @macros[name] = make_obj_macro([value])
        end

        # @param [<Token>] body
        # @return [Macro]
        def make_obj_macro(body)
          Macro.new(M::OBJ, body: body)
        end

        # @param [<Token>] body
        # @param [Integer] nargs
        # @param [Boolean] is_varg
        def make_func_macro(body, nargs, is_varg)
          Macro.new(M::FUNC, body: body, nargs: nargs, is_varg: is_varg)
        end

        # @param [Proc] fn
        def make_special_macro(fn)
          Macro.new(M::SPECIAL, fn: fn)
        end

        # @param [Boolean] wastrue
        def make_cond_incl(wastrue)
          CondIncl.new(CondInclCtx::THEN, wastrue: wastrue)
        end

        # @param [Integer] position
        # @param [Boolean] is_vararg
        def make_macro_token(position, is_vararg)
          Token.new(T::MACRO_PARAM,
                    is_vararg: is_vararg,
                    hideset: nil,
                    position: position,
                    space: false,
                    bol: false,
                   )
        end

        # @param [Token] tok
        # @return [Token]
        def copy_token(tok)
          tok.dup
        end
      end
    end
  end
end
