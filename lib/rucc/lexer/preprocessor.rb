require "set"
require "rucc/m"
require "rucc/macro"
require "rucc/lexer/preprocessor/cond_incl"
require "rucc/lexer/preprocessor/constructor"
require "rucc/lexer/preprocessor/pragma"
require "rucc/lexer/preprocessor/special_macro"

module Rucc
  class Lexer
    class Preprocessor
      include Constructor
      include SpecialMacro
      include Pragma

      # @param [Impl] impl
      def initialize(impl)
        @impl = impl
        @std_include_path = []

        # preprocessor context
        @cond_incl_stack = []
        @macros = {}
        @once = {}
        @include_guard = {}

        # warning context
        # TODO(south37) Impl warnf
        @enable_warning = true

        # Used for __DATE__ and __TIME__
        @now = Time.now

        define_special_macros!
      end

      # Return parsed node, only used for read_constexpr
      attr_writer :expr_reader

      # @return [Token]
      def read_token
        while true
          tok = read_expand
          if tok.bol && Token.is_keyword?(tok, '#') && (tok.hideset.size == 0)
            read_directive(tok)
            next
          end
          Util.assert!{ !T::CPP_TOKENS.include?(tok.kind) }
          return maybe_convert_keyword(tok)
        end
        raise "Must not reach here!"
      end

      # @param [Token] tok
      def unget_token(tok)
        @impl.unget_token(tok)
      end

      # @return [Token]
      def peek_token
        r = read_token
        unget_token(r)
        r
      end

      # @param [String] path
      def append_include_path(path)
        @std_include_path << path
      end

    private

      # @return [Token]
      def read_expand
        while true
          tok = read_expand_newline
          return tok if tok.kind != T::NEWLINE
        end
      end

      # Note: This is "expand" function in the Dave Prosser's document.
      # @return [Token]
      def read_expand_newline
        tok = @impl.lex
        if tok.kind != T::IDENT
          return tok
        end
        name = tok.sval
        macro = @macros[name]
        if !macro || tok.hideset.include?(name)
          return tok
        end

        case macro.kind
        when M::OBJ
          hideset = tok.hideset.dup
          hideset << name
          tokens = subst(macro, nil, hideset)
          propagate_space(tokens, tok)
          @impl.unget_all(tokens)
          return read_expand
        when M::FUNC
          if !next?('(')
            return tok
          end
          args = read_args(tok, macro)
          rparen = peek_token
          expect!(')')
          hideset = ((tok.hideset & rparen.hideset) << name)
          tokens = subst(macro, args, hideset)
          propagate_space(tokens, tok)
          @impl.unget_all(tokens)
          return read_expand
        when M::SPECIAL
          macro.fn.call(tok)
          return read_expand
        else
          raise "internal error"
        end
      end

      # @param [Token] tok
      # @return [Token]
      def maybe_convert_keyword(tok)
        return tok if tok.kind != T::IDENT

        id = (K.keywords[tok.sval] || OP.operators[tok.sval])
        return tok if id.nil?

        r = tok.dup
        r.kind = T::KEYWORD
        r.id = id
        r
      end

      # @param [Token] hash
      def read_directive(hash)
        tok = @impl.lex
        if tok.kind == T::NEWLINE
          return
        end
        if tok.kind == T::NUMBER
          read_linemarker(tok)
          return
        end
        if tok.kind != T::IDENT
          raise "unsupported preprocessor directive: #{tok}"
        end

        # NOTE: only for debug
        # print "#{' ' * 2 * @cond_incl_stack.size}##{tok.sval}\n"

        case tok.sval
        when "define"       then read_define
        when "elif"         then read_elif(hash)
        when "else"         then read_else(hash)
        when "endif"        then read_endif(hash)
        when "error"        then read_error(hash)
        when "if"           then read_if
        when "ifdef"        then read_ifdef
        when "ifndef"       then read_ifndef
        when "import"       then read_include(hash, tok.file, true)
        when "include"      then read_include(hash, tok.file, false)
        when "include_next" then read_include_next(hash, tok.file)
        when "line"         then read_line
        when "pragma"       then read_pragma
        when "undef"        then read_undef
        when "warning"      then read_warning(hash)
        else
          raise "unsupported preprocessor directive: #{tok}"
        end
      end

      # GNU CPP outputs "# linenum filename flags" to preserve original
      # source file information. This function reads them. Flags are ignored.
      #
      # @param [Token] tok
      def read_linemarker(tok)
        if !is_digit_sequence?(tok.sval)
          Util.errort!(tok, "line number expected, but got #{tok}")
        end
        line = tok.sval.to_i
        tok = @impl.lex
        if tok.kind != T::STRING
          Util.errort!(tok, "filename expected, but got #{tok}")
        end
        filename = tok.sval

        tok = @impl.lex
        while tok.kind != T::NEWLINE
          tok = @impl.lex
        end
        file = @impl.current_file
        file.line = line
        file.name = filename
      end

      # @param [Token] tok
      # @param [Macro] macro
      # @return [<Token>]
      def read_args(tok, macro)
        if (macro.nargs == 0) && Token.is_keyword?(peek_token, ')')
          # If a macro M has no parameter, argument list of M()
          # is an empty list. If it has one parameter,
          # argument list of M() is a list containing an empty list.
          return []
        end
        args = do_read_args(tok, macro)
        if args.size != macro.nargs
          Util.errort!(tok, "macro argument number does not match");
        end
        args
      end

      # @param [Token] ident
      # @param [Macro] macro
      # @return [<Token>]
      def do_read_args(ident, macro)
        r = []
        e = false
        while !e
          in_ellipsis = macro.is_varg && (r.size + 1 == macro.nargs)
          arg, e = read_one_arg(ident, in_ellipsis)
          r.push(arg)
        end
        if macro.is_varg && (r.size == macro.nargs - 1)
          r.push([])
        end
        r
      end

      # @param [Token] ident
      # @param [Boolean] readall
      # @return [<<Token>, Boolean>]
      def read_one_arg(ident, readall)
        r = []
        level = 0
        while true
          tok = @impl.lex
          if tok.kind == T::EOF
            Util.errort!(ident, "unterminated macro argument list")
          end
          if tok.kind == T::NEWLINE
            next
          end
          if tok.bol && Token.is_keyword?(tok, '#')
            read_directive(tok)
            next
          end
          if (level == 0) && Token.is_keyword?(tok, ')')
            unget_token(tok)
            return r, true
          end
          if (level == 0) && Token.is_keyword?(tok, ',') && !readall
            return r, false
          end
          if Token.is_keyword?(tok, '(')
            level += 1
          end
          if Token.is_keyword?(tok, ')')
            level -= 1
          end
          # C11 6.10.3p10: Within the macro argument list,
          # newline is considered a normal whitespace character.
          # I don't know why the standard specifies such a minor detail,
          # but the difference of newline and space is observable
          # if you stringize tokens using #.
          if tok.bol
            tok = copy_token(tok)
            tok.bol = false
            tok.space = true
          end
          r.push(tok)
        end
      end

      # @param [Char] id
      # @return [Boolean]
      def next?(id)
        tok = @impl.lex
        if Token.is_keyword?(tok, id)
          return true
        end
        @impl.unget_token(tok)
        false
      end

      # @param(return) [<Token>] tokens
      # @param [Token] tmpl
      def propagate_space(tokens, tmpl)
        if tokens.size == 0
          return
        end
        tok = copy_token(tokens.first)
        tok.space = tmpl.space
        tokens[0] = tok
      end

      # @param [Char] id
      def expect!(id)
        tok = @impl.lex
        if !Token.is_keyword?(tok, id)
          raise "#{id} expected, but got #{tok}"
        end
      end

      # @param [Macro] macro
      # @param [Array] args
      # @param [Set] hideset
      # @return [<Token>]
      def subst(macro, args, hideset)
        r = []
        i = 0
        len = macro.body.size
        while i < len
          t0 = macro.body[i]
          t1 = macro.body[i + 1]  # Note: nil when i == (macro.body.size - 1)
          t0_param = (t0.kind == T::MACRO_PARAM)
          t1_param = (t1 && t1.kind == T::MACRO_PARAM)

          if Token.is_keyword?(t0, '#') && t1_param
            r.push(stringize(t0, args[t1.position]))
            i += 2
            next
          end
          if Token.is_keyword?(t0, K::HASHHASH) && t1_param
            arg = args[t1.position]
            # [GNU] [,##__VA_ARG__] is expanded to the empty token sequence
            # if __VA_ARG__ is empty. Otherwise it's expanded to
            # [,<tokens in __VA_ARG__>].
            if t1.is_vararg && (r.size > 0) && Token.is_keyword?(r.last, ',')
              if arg.size > 0
                r += arg
              else
                r.pop
              end
            elsif arg.size > 0
              glue_push(r, arg.first)
              arg[1..-1].each do |e|
                r.push(e)
              end
            end
            i += 2
            next
          end
          if Token.is_keyword?(t0, K::HASHHASH) && t1
            hideset = t1.hideset
            glue_push(r, t1)
            i += 2
            next
          end
          if t0_param && t1 && Token.is_keyword?(t1, K::HASHHASH)
            hideset = t1.hideset
            arg = args[t0.position]
            if arg.size == 0
              i += 2
              next
            else
              r += arg
              i += 1
              next
            end
          end
          if t0_param
            arg = args[t0.position]
            r += expand_all(arg, t0)
            i += 1
            next
          end
          r.push(t0)
          i += 1
        end
        add_hide_set(r, hideset)
      end

      # @param(result) [<Token>] tokens
      # @param [Token] tok
      def glue_push(tokens, tok)
        last = tokens.pop
        tokens.push(glue_tokens(last, tok))
      end

      # @param [Token] t
      # @param [Token] u
      # @return [Token]
      def glue_tokens(t, u)
        b = "#{t}#{u}"
        r = @impl.lex_string(b)
        r
      end

      # @param [Token] tmpl
      # @param [<Token>] args
      def stringize(tmpl, args)
        b = ""
        args.each do |tok|
          if b.size > 0 && tok.space
            b << " "
          end
          b << tok.to_s
        end
        r = tmpl.dup
        r.kind = T::STRING
        r.sval = b
        r.enc = ENC::NONE
        r
      end

      # @return [<Token>]
      def expand_all(tokens, tmpl)
        @impl.token_buffer_stash(tokens.reverse)
        r = []
        while true
          tok = read_expand
          if tok.kind == T::EOF
            break
          end
          r.push(tok)
        end
        propagate_space(r, tmpl)
        @impl.token_buffer_unstash
        r
      end

      # @param [<Token>] tokens
      # @param [Set] hideset
      # @return [<Token>]
      def add_hide_set(tokens, hideset)
        r = []
        tokens.each do |token|
          t = copy_token(token)
          t.hideset = (t.hideset | hideset)
          r.push(t)
        end
        r
      end

      # @param [Token] hash
      # @param [FileIO] file
      # @param [Boolean] isimport
      def read_include(hash, file, isimport)
        filename, std = read_cpp_header_name(hash)
        expect_newline!
        if filename[0] == '/'
          if try_include("/", filename, isimport)
            return
          end
          Util.errort!(hash, "cannot find header file: #{filename}")
        end
        if !std
          dir = file.name ? File.dirname(file.name) : "."
          if try_include(dir, filename, isimport)
            return
          end
        end
        @std_include_path.each do |path|
          if try_include(path, filename, isimport)
            return
          end
        end
        Util.errort!(hash, "cannot find header file: #{filename}")
      end

      # @raise [RuntimeError]
      def expect_newline!
        tok = @impl.lex
        if tok.kind != T::NEWLINE
          raise "newline expected, but got #{tok}"
        end
      end

      # @param [Token] hash
      # @return [String, Boolean]
      def read_cpp_header_name(hash)
        # Try reading a filename using a special tokenizer for #include.
        path, std = @impl.read_header_file_name
        if path
          return path, std
        end

        # If a token following #include does not start with < nor ",
        # try to read the token as a regular token. Macro-expanded
        # form may be a valid header file path.
        tok = read_expand_newline
        if tok.kind == T::NEWLINE
          Util.errort!(hash, "expected filename, but got newline")
        end
        if tok.kind == T::STRING
          std = false
          return tok.sval, std
        end
        if !Token.is_keyword?(tok, '<')
          Util.errort!(tok, "< expected, but got #{tok}")
        end
        tokens = []
        while true
          tok = read_expand_newline
          if tok.kind == T::NEWLINE
            Util.errort!(hash, "premature end of header name")
          end
          if Token.is_keyword?(tok, '>')
            break
          end
          tokens.push(tok)
        end
        std = true

        return tokens.join, std
      end

      # @param [String] dir
      # @param [String] filename
      # @param [Boolean] isimport
      # @return [Boolean]
      def try_include(dir, filename, isimport)
        path = File.join(dir, filename)
        if @once[path]
          return true
        end
        if guarded?(path)
          return true
        end

        # NOTE: file may not exist
        begin
          fp = File.open(path, "r")
        rescue Errno::ENOENT
          return false
        end

        if isimport
          @once[path] = true
        end
        @impl.push_file(FileIO.new(fp, path))
        true
      end

      CPP_TOKEN_ZERO = Token.new(T::NUMBER, sval: "0")
      CPP_TOKEN_ONE  = Token.new(T::NUMBER, sval: "1")

      # @param [String] path
      # @return [Boolean]
      def guarded?(path)
        guard = @include_guard[path]
        r = guard && @macros[guard]
        define_obj_macro("__8cc_include_guard", r ? CPP_TOKEN_ONE : CPP_TOKEN_ZERO)
        r
      end

      def read_line
        tok = read_expand_newline
        if (tok.kind != T::NUMBER) || !is_digit_sequence?(tok.sval)
          Util.errort!(tok, "number expected after #line, but got #{tok}")
        end
        line = tok.sval.to_i
        tok = read_expand_newline
        if tok.kind == T::STRING
          filename = tok.sval
          expect_newline!
        elsif tok.kind != T::NEWLINE
          Util.errort!(tok, "newline or a source name are expected, but got #{tok}")
        end
        f = @impl.current_file
        f.line = line
        if filename
          f.name = filename
        end
      end

      # @param [String] p
      # @return [Boolean]
      def is_digit_sequence?(p)
        p.match(/^\d*$/)
      end

      def read_if
        do_read_if(read_constexpr)
      end

      # @return [Boolean]
      def read_constexpr
        @impl.token_buffer_stash(read_intexpr_line.reverse)
        Util.assert!{ !@expr_reader.nil? }
        expr = @expr_reader.call
        tok = @impl.lex
        if tok.kind != T::EOF
          Util.errort!(tok, "stray token: #{tok}")
        end
        @impl.token_buffer_unstash
        n, _ = IntEvaluator.eval(expr)
        n != 0
      end

      def read_ifdef
        tok = @impl.lex
        if tok.kind != T::IDENT
          Util.errort!(tok, "identifier expected, but got #{tok}")
        end
        do_read_if(@macros[tok.sval])
      end

      def read_ifndef
        tok = @impl.lex
        if tok.kind != T::IDENT
          Util.errort!(tok, "identifier expected, but got #{tok}")
        end
        expect_newline!
        do_read_if(!@macros[tok.sval])
        if tok.count == 2
          # "ifndef" is the second token in this file.
          # Prepare to detect an include guard.
          ci = @cond_incl_stack.last
          ci.include_guard = tok.sval
          ci.file = tok.file
        end
      end

      # @param [Boolean] istrue
      def do_read_if(istrue)
        @cond_incl_stack.push(make_cond_incl(istrue))

        if (!istrue)
          @impl.skip_cond_incl!
        end
      end

      def read_define
        name = read_ident
        tok = @impl.lex
        if Token.is_keyword?(tok, '(') && !tok.space
          read_funclike_macro(name)
          return
        end
        @impl.unget_token(tok)
        read_obj_macro(name.sval)
      end

      # @param [Token] name
      def read_funclike_macro(name)
        param = {}
        param, isvarg = read_funclike_macro_params(name)
        body = read_funclike_macro_body(param)
        hashhash_check!(body)
        macro = make_func_macro(body, param.size, isvarg)
        @macros[name.sval] = macro
      end

      # @param [Token] name
      # @return [<Hash, Boolean>]
      def read_funclike_macro_params(name)
        pos = 0
        param = {}
        while true
          tok = @impl.lex
          if Token.is_keyword?(tok, ')')
            return param, false
          end
          if pos > 0
            if !Token.is_keyword?(tok, ',')
              Util.errort!(tok, ", expected, but got #{tok}")
            end
            tok = @impl.lex
          end
          if tok.kind == T::NEWLINE
            Util.errort!(name, "missing ')' in macro parameter list")
          end
          if Token.is_keyword?(tok, K::ELLIPSIS)
            param["__VA_ARGS__"] = make_macro_token(pos, true)
            pos += 1
            expect!(')')
            return param, true
          end
          if tok.kind != T::IDENT
            Util.errort!(tok, "identifier expected, but got #{tok}")
          end
          arg = tok.sval
          if next?(K::ELLIPSIS)
            expect!(')')
            param[arg] = make_macro_token(pos, true)
            pos += 1
            return param, true
          end
          param[arg] = make_macro_token(pos, false)
          pos += 1
        end
      end

      # @param [Hash] param
      # @return [<Token>]
      def read_funclike_macro_body(param)
        r = []
        while true
          tok = @impl.lex
          if tok.kind == T::NEWLINE
            return r
          end
          if tok.kind == T::IDENT
            subst = param[tok.sval]
            if subst
              subst = copy_token(subst)
              subst.space = tok.space
              r.push(subst)
              next
            end
          end
          r.push(tok)
        end
      end

      # @param [String] name
      def read_obj_macro(name)
        body = []
        while true
          tok = @impl.lex
          if tok.kind == T::NEWLINE
            break
          end
          body.push(tok)
        end
        hashhash_check!(body)
        @macros[name] = make_obj_macro(body)
      end

      # @param [<Token>] v
      # @raise
      def hashhash_check!(v)
        if v.size == 0
          return
        end
        if Token.is_keyword?(v.first, K::HASHHASH)
          Util.errort!(vec_head(v), "'##' cannot appear at start of macro expansion")
        end
        if Token.is_keyword?(v.last, K::HASHHASH)
          Util.errort!(vec_tail(v), "'##' cannot appear at end of macro expansion")
        end
      end

      # @return [Token]
      def read_ident
        tok = @impl.lex
        if tok.kind != T::IDENT
          Util.errort!(tok, "identifier expected, but got #{tok}")
        end
        tok
      end

      # @return [<Token>]
      def read_intexpr_line
        r = []
        while true
          tok = read_expand_newline
          if tok.kind == T::NEWLINE
            return r
          end
          if Token.is_ident?(tok, "defined")
            r.push(read_defined_op)
          elsif tok.kind == T::IDENT
            # C11 6.10.1.4 says that remaining identifiers
            # should be replaced with pp-number 0.
            r.push(CPP_TOKEN_ZERO)
          else
            r.push(tok)
          end
        end
      end

      # @return [Token]
      def read_defined_op
        tok = @impl.lex
        if Token.is_keyword?(tok, '(')
          tok = @impl.lex
          expect!(')')
        end
        if tok.kind != T::IDENT
          Util.errort!(tok, "identifier expected, but got #{tok}")
        end
        @macros[tok.sval] ? CPP_TOKEN_ONE : CPP_TOKEN_ZERO
      end

      # @param [Token] hash
      def read_elif(hash)
        if @cond_incl_stack.size == 0
          Util.errort!(hash, "stray #elif")
        end
        ci = @cond_incl_stack.last
        if ci.ctx == CondInclCtx::ELSE
          Util.errort!(hash, "#elif after #else")
        end
        ci.ctx = CondInclCtx::ELIF
        ci.include_guard = nil
        if ci.wastrue || !read_constexpr
          @impl.skip_cond_incl!
          return
        end
        ci.wastrue = true
      end

      # @param [Token] hash
      def read_else(hash)
        if @cond_incl_stack.size == 0
          Util.errort!(hash, "stray #else")
        end
        ci = @cond_incl_stack.last
        if ci.ctx == CondInclCtx::ELSE
          Util.errort!(hash, "#else appears in #else")
        end
        expect_newline!
        ci.ctx = CondInclCtx::ELSE
        ci.include_guard = nil
        if ci.wastrue
          @impl.skip_cond_incl!
        end
      end

      # @param [Token] hash
      def read_endif(hash)
        if @cond_incl_stack.size == 0
          Util.errort!(hash, "stray #endif")
        end
        ci = @cond_incl_stack.pop
        expect_newline!

        # Detect an #ifndef and #endif pair that guards the entire
        # header file. Remember the macro name guarding the file
        # so that we can skip the file next time.
        if !ci.include_guard || ci.file != hash.file
          return
        end
        last = skip_newlines!
        if ci.file != last.file
          @include_guard[ci.file.name] = ci.include_guard
        end
      end

      # Skips all newlines and returns the first non-newline token.
      #
      # @return [Token]
      def skip_newlines!
        tok = @impl.lex
        while (tok.kind == T::NEWLINE)
          tok = @impl.lex
        end
        @impl.unget_token(tok)
        tok
      end

      # @param [Token] hash
      def read_error(hash)
        Util.errort!(hash, "#error: #{read_error_message}")
      end

      # @param [Token] hash
      def read_warning(hash)
        print "#warning: #{read_error_message}\n"
        # warnt(hash, "#warning: %s", read_error_message());
      end

      # @return [String]
      def read_error_message
        b = ""
        while true
          tok = @impl.lex
          if tok.kind == T::NEWLINE
            return b
          end
          if (b.size != 0) && tok.space
            b << ' '
          end
          b << "#{tok}"
        end
      end

      def read_undef
        name = read_ident
        expect_newline!
        @macros.delete(name.sval)
      end
    end
  end
end
