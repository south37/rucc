module Rucc
  class Lexer
    class Preprocessor
      module Pragma

      private

        # @param [Token] tok
        def parse_pragma_operand(tok)
          s = tok.sval
          case s
          when "once"
            path = File.expand_path(tok.file.name)
            @once[path] = 1
          when "enable_warning"
            @enable_warning = true
          when "disable_warning"
            @enable_warning = false
          else
            raise "unknown #pragma: #{s}"
            # errort(tok, "unknown #pragma: %s", s);
          end
        end

        def read_pragma
          tok = read_ident
          parse_pragma_operand(tok)
        end
      end
    end
  end
end
