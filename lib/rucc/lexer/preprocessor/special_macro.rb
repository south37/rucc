module Rucc
  class Lexer
    class Preprocessor
      module SpecialMacro

      private

        def define_special_macros!
          define_special_macro "__DATE__",          :handle_date_macro
          define_special_macro "__TIME__",          :handle_time_macro
          define_special_macro "__FILE__",          :handle_file_macro
          define_special_macro "__LINE__",          :handle_line_macro
          define_special_macro "_Pragma",           :handle_pragma_macro

          # [GNU] Non-standard macros
          define_special_macro "__BASE_FILE__",     :handle_base_file_macro
          define_special_macro "__COUNTER__",       :handle_counter_macro
          define_special_macro "__INCLUDE_LEVEL__", :handle_include_level_macro
          define_special_macro "__TIMESTAMP__",     :handle_timestamp_macro
        end

        # @param [Symbol] fn handler name of special macro
        def define_special_macro(name, fn)
          # @param [Token] tok
          handler = -> (tok) { self.send(fn, tok) }
          @macros[name] = make_special_macro(handler)
        end

        ##
        # Handlers
        ##

        # @param [Token] tmpl
        def handle_date_macro(tmpl)
          s = @now.strftime("%b %e %Y")
          make_token_pushback(tmpl, T::STRING, s)
        end

        # @param [Token] tmpl
        def handle_time_macro(tmpl)
          s = @now.strftime("%T")
          make_token_pushback(tmpl, T::STRING, s)
        end

        # @param [Token] tmpl
        def handle_timestamp_macro(tmpl)
          # [GNU] __TIMESTAMP__ is expanded to a string that describes the date
          # and time of the last modification time of the current source file.
          s = tmpl.file.mtime.strftime("%a %b %e %T %Y")
          make_token_pushback(tmpl, T::STRING, s)
        end

        # @param [Token] tmpl
        def handle_file_macro(tmpl)
          make_token_pushback(tmpl, T::STRING, tmpl.file.name)
        end

        # @param [Token] tmpl
        def handle_line_macro(tmpl)
          make_token_pushback(tmpl, T::NUMBER, sprintf("%d", tmpl.file.line))
        end

        # @param [Token] tmpl
        def handle_pragma_macro(tmpl)
          expect!('(')
          operand = read_token
          if operand.kind != T::STRING
            raise "_Pragma takes a string literal, but got #{operand}"
            # errort(operand, "_Pragma takes a string literal, but got %s", tok2s(operand));
          end
          expect!(')')
          parse_pragma_operand(operand)
          make_token_pushback(tmpl, T::NUMBER, "1")
        end

        # @param [Token] tmpl
        def handle_base_file_macro(tmpl)
          make_token_pushback(tmpl, T::STRING, @impl.infile.name)
        end

        # @param [Token] tmpl
        def handle_counter_macro(tmpl)
          @counter ||= 0
          i = @counter
          make_token_pushback(tmpl, T::NUMBER, "%d" % i)
          @counter += 1
        end

        # @param [Token] tmpl
        def handle_include_level_macro(tmpl)
          make_token_pushback(tmpl, T::NUMBER, "%d" % (@impl.stream_depth - 1))
        end

        ##
        # Helper
        ##

        # @param [Token] tmpl
        # @param [T] kind
        # @param [String] sval
        def make_token_pushback(tmpl, kind, sval)
          tok = tmpl.dup
          tok.kind = kind
          tok.sval = sval
          tok.enc = ENC::NONE
          unget_token(tok)
        end
      end
    end
  end
end
