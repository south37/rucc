require "forwardable"

require "rucc/file_io"
require "rucc/token_gen"
require "rucc/pos"

module Rucc
  class Lexer
    class Impl
      extend Forwardable

      # @param [FileIOList] files
      def initialize(files)
        @infile = files.first
        @files = files

        @buffers = [[]]  # stack buffers to impl peek.
        @token_gen = TokenGen.new(@files)
      end
      attr_reader :infile
      delegate [:stream_depth] => :@files

      # @param [Token] tok
      def unget_token(tok)
        return if tok.kind == T::EOF  # Does not unget
        buf = @buffers.last
        buf.push(tok)
      end

      # @param [<Token>] tokens
      def unget_all(tokens)
        tokens.reverse.each { |token| unget_token(token) }
      end

      # @return [Token]
      def lex
        buf = @buffers.last
        if buf.size > 0
          return buf.pop
        end

        if @buffers.size > 1
          return Token::EOF_TOKEN
        end

        bol = (current_file.column == 1)
        tok = do_read_token
        while tok.kind == T::SPACE
          tok = do_read_token
          tok.space = true
        end
        tok.bol = bol

        # NOTE: only for debug
        # if tok.kind == T::NEWLINE
        #   print "\n"
        # else
        #   print " " if tok.space
        #   print tok
        #   # print current_file.name
        # end

        tok
      end

      # Reads a token from a given string.
      # This function temporarily switches the main input stream to
      # a given string and reads one token.
      #
      # @param [String] s
      # @return [Token
      def lex_string(s)
        @files.stream_stash([FileIO.new(StringIO.new(s), "-")])
        r = do_read_token
        next?("\n")
        p = get_pos(0)
        if peek != nil  # EOF
          raise "#{p}: unconsumed input: #{s}"
          # errorp(p, "unconsumed input: %s", s)
        end
        @files.stream_unstash
        r
      end

      # Reads a header file name for #include.
      #
      # Filenames after #include need a special tokenization treatment.
      # A filename string may be quoted by < and > instead of "".
      # Even if it's quoted by "", it's still different from a regular string token.
      # For example, \ in this context is not interpreted as a quote.
      # Thus, we cannot use lex() to read a filename.
      #
      # That the C preprocessor requires a special lexer behavior only for
      # #include is a violation of layering. Ideally, the lexer should be
      # agnostic about higher layers status. But we need this for the C grammar.
      #
      # @return [<String, Boolean>, <NilClass, NilClass>]
      def read_header_file_name
        std = nil
        if !buffer_empty?
          return nil, std
        end

        skip_space!
        p = get_pos(0)
        if next?('"')
          std = false
          close = '"'
        elsif next?('<')
          std = true
          close = '>'
        else
          return nil, std
        end
        b = ""
        while !next?(close)
          c = readc
          if c.nil? || c == '\n'
            raise "#{p}: premature end of header name"
            # errorp(p, "premature end of header name");
          end
          b << c
        end
        if b.size == 0
          raise "#{p}: header name should not be empty"
          # errorp(p, "header name should not be empty");
        end

        return b, std
      end

      # @param [FileIO]
      def push_file(file)
        @files.push(file)
      end

      # Temporarily switches the input token stream to given list of tokens,
      # so that you can get the tokens as return values of lex() again.
      # After the tokens are exhausted, EOF is returned from lex() until
      # "unstash" is called to restore the original state.
      #
      # @param [<Token>] buf
      def token_buffer_stash(buf)
        @buffers.push(buf)
      end

      def token_buffer_unstash
        @buffers.pop
      end

      # Skips a block of code excluded from input by #if, #ifdef and the like.
      # C11 6.10 says that code within #if and #endif needs to be a sequence of
      # valid tokens even if skipped. However, in reality, most compilers don't
      # tokenize nor validate contents. We don't do that, too.
      # This function is to skip code until matching #endif as fast as we can.
      def skip_cond_incl!
        nest = 0
        while true
          bol = current_file.column == 1
          skip_space!
          c = readc
          if c.nil?  # EOF
            return
          end
          if c == '\''
            skip_char!
            next
          end
          if c == '"'
            skip_string!
            next
          end
          if (c != '#' || !bol)
            next
          end
          column = current_file.column - 1
          tok = lex
          if (tok.kind != T::IDENT)
            next
          end
          if (nest == 0) && (Token.is_ident?(tok, "else") || Token.is_ident?(tok, "elif") || Token.is_ident?(tok, "endif"))
            unget_token(tok)
            hash = @token_gen.make_keyword('#')
            hash.bol = true
            hash.column = column
            unget_token(hash)
            return
          end
          if Token.is_ident?(tok, "if") || Token.is_ident?(tok, "ifdef") || Token.is_ident?(tok, "ifndef")
            nest += 1
          elsif (nest > 0) && Token.is_ident?(tok, "endif")
            nest -= 1
          end
          skip_line!
        end
      end

      # @return [FileIO]
      def current_file
        @files.current
      end

    private

      # @return [Char, NilClass]
      def readc
        @files.readc
      end

      # @param [Char]
      def unreadc(c)
        @files.unreadc(c)
      end

      # Update current position
      def mark!
        @token_gen.pos = get_pos(0)
      end

      # @param [Integer] delta
      # @return [Pos]
      def get_pos(delta)
        Pos.new(current_file.line, current_file.column + delta)
      end

      # @return [Boolean]
      def buffer_empty?
        @buffers.size == 1 && @buffers.first.size == 0
      end

      # @param [Char] c
      # @return [Boolean]
      def iswhitespace(c)
        (c == ' ' || c == "\t" || c == "\f" || c == "\v")
      end

      def skip_block_comment!
        # TODO(south37) Impl when necessary
        # Pos p = get_pos(-2);
        maybe_end = false
        while true
          c = readc
          if c.nil?
            raise "premature end of block comment"
            # TODO(south37) Impl when necessary
            # errorp(p, "premature end of block comment");
          end
          return if (c == '/' && maybe_end)
          maybe_end = (c == '*')
        end
        raise "Must not reach here"
      end

      def skip_line!
        while true
          c = readc
          return if c.nil?
          if c == "\n"
            unreadc(c)
            return
          end
        end
        raise "Must not reach here"
      end

      # Skips spaces including comments.
      # Returns true if at least one space is skipped.
      #
      # @return [Boolean] true if skipped
      def skip_space!
        if !do_skip_space!
          return false
        end
        while do_skip_space!; end
        true
      end

      # @return [Boolean]
      def do_skip_space!
        c = readc
        if c.nil?  # EOF
          return false
        end
        if iswhitespace(c)
          return true;
        end
        if c == '/'
          if next?('*')
            skip_block_comment!
            return true
          end
          if next?('/')
            skip_line!
            return true
          end
        end
        unreadc(c)
        false
      end

      def skip_char!
        if readc == '\\'
          readc
        end
        c = readc
        while (!c.nil? && c != '\'')
          c = readc
        end
      end

      def skip_string!
        c = readc
        while (!c.nil? && c != '"')
          if c == '\\'
            readc
          end
          c = readc
        end
      end

      # @param [Char] c
      # @return [Boolean]
      def next?(expect)
        c = readc
        return true if c == expect
        unreadc(c)
        false
      end

      # @param [Char] expect1
      # @param [OP] t
      # @param [Char] els
      # @return [Token]
      def read_rep(expect, t, els)
        @token_gen.make_keyword(next?(expect) ? t : els)
      end

      # @param [Char] expect1
      # @param [OP] t1
      # @param [Char] expect2
      # @param [OP] t2
      # @param [Char] els
      # @return [Token]
      def read_rep2(expect1, t1, expect2, t2, els)
        return @token_gen.make_keyword(t1) if next?(expect1)
        return @token_gen.make_keyword(t2) if next?(expect2)
        @token_gen.make_keyword(els)
      end

      # Reads a digraph starting with '%'. Digraphs are alternative spellings
      # for some punctuation characters. They are useless in ASCII.
      # We implement this just for the standard compliance.
      # See C11 6.4.6p3 for the spec.
      #
      # @return [Token, NilClass]
      def read_hash_digraph
        if next?('>')
          return @token_gen.make_keyword('}')
        end
        if next?(':')
          if next?('%')
            if next?(':')
              return @token_gen.make_keyword(K::HASHHASH)
            end
            unreadc('%')
          end
          return @token_gen.make_keyword('#')
        end
        nil
      end

      def read_ident(c)
        b = c.dup
        while true
          c = readc
          if c && (Libc.isalnum(c) || ((c.ord & 0x80) > 0) || (c == '_') || (c == '$'))
            b << c
            next
          end
          # C11 6.4.2.1: \u or \U characters (universal-character-name)
          # are allowed to be part of identifiers.
          if c && (c == '\\' && (peek == 'u' || peek == 'U'))
            escaped = read_escaped_char
            UTF.write_utf8(b, escaped)
            next
          end
          unreadc(c)
          return @token_gen.make_ident(b)
        end
        raise "Must not reach here!"
      end

      # @param [ENC] enc
      # @return [Token]
      def read_char(enc)
        c = readc
        r = (c == '\\'.freeze) ? read_escaped_char : c.ord
        c = readc
        if c != "'".freeze
          raise "unterminated char"
          # errorp(pos, "unterminated char");
        end
        if enc == ENC::NONE
          # NOTE: Only lower 8 bit has meaning
          return @token_gen.make_char(0xFF & r, enc)
        end
        @token_gen.make_char(r, enc)
      end

      # @param [ENC]
      # @return [Token]
      def read_string(enc)
        b = ""
        while true
          c = readc
          if c.nil?
            raise "unterminated string"
            # TODO(south37) Impl errorp if necessary
            # errorp(pos, "unterminated string");
          end
          if c == '"'
            break
          end
          if c != '\\'
            b << c
            next
          end
          # Just after backslash escape
          isucs = (peek == 'u' || peek == 'U')
          c = read_escaped_char
          if isucs
            UTF.write_utf8(b, c)
            next
          end
          b << c
        end
        @token_gen.make_strtok(b, enc)
      end

      # @return [Integer]
      def read_escaped_char
        # TODO(south37) Impl when necessary
        # Pos p = get_pos(-1);
        c = readc
        case c
        when '\'', '"', '?', '\\'
          c.ord
        when 'a'
          return "\a".ord
        when 'b'
          return "\b".ord
        when 'f'
          return "\f".ord
        when 'n'
          return "\n".ord
        when 'r'
          return "\r".ord
        when 't'
          return "\t".ord
        when 'v'
          return "\v".ord
        when 'e'
          return "\e".ord  # '\e' is GNU extension
        when 'x'
          return read_hex_char
        when 'u'
          return read_universal_char(4)
        when 'U'
          return read_universal_char(8)
        when *'0'..'7'
          return read_octal_char(c)
        end
        # TODO(south37) Impl when necessary
        # warnp(p, "unknown escape character: \\%c", c);
        c.ord
      end

      # Reads a number literal. Lexer's grammar on numbers is not strict.
      # Integers and floating point numbers and different base numbers are not distinguished.
      # @param [Char] c
      def read_number(c)
        b = c.dup
        last = c
        while true
          c = readc
          flonum = "eEpP".freeze.include?(last) && "+-".freeze.include?(c)
          if !Libc.isdigit(c) && !Libc.isalpha(c) && c != '.' && !flonum
            unreadc(c)
            return @token_gen.make_number(b)
          end
          b << c
          last = c
        end
        raise "Must not reach here"
      end

      # Reads a \x escape sequence.
      #
      # @return [Integer]
      def read_hex_char
        p = get_pos(-2)
        c = readc
        if !Libc.isxdigit(c)
          raise "#{p}: \\x is not followed by a hexadecimal character: #{c}"
          # errorp(p, "\\x is not followed by a hexadecimal character: %c", c);
        end
        r = 0
        while true
          case c
          when '0' .. '9' then r = (r << 4) | (c.ord - '0'.ord)
          when 'a' .. 'f' then r = (r << 4) | (c.ord - 'a'.ord + 10)
          when 'A' .. 'F' then r = (r << 4) | (c.ord - 'A'.ord + 10)
          else
            unreadc(c)
            return r
          end
          c = readc
        end
      end

      # Reads \u or \U escape sequences. len is 4 or 8, respecitvely.
      #
      # @param [Integer] len
      # @return [Integer]
      def read_universal_char(len)
        p = get_pos(-2)
        r = 0
        len.times do
          c = readc
          case c
          when *'0'..'9' then r = (r << 4) | (c.ord - '0'.ord)
          when *'a'..'f' then r = (r << 4) | (c.ord - 'a'.ord + 10)
          when *'A'..'F' then r = (r << 4) | (c.ord - 'A'.ord + 10)
          else
            raise "#{p}: invalid universal character: #{c}"
            # errorp(p, "invalid universal character: %c", c)
          end
        end
        if !is_valid_ucn(r)
          raise "#{p}: invalid universal character: \\#{(len == 4) ? 'u' : 'U'}#{format("%0#{len}d", r)}"
          # errorp(p, "invalid universal character: \\%c%0*x", (len == 4) ? 'u' : 'U', len, r);
        end
        r
      end

      # @param [Integer] c
      # @return [Boolean]
      def is_valid_ucn(c)
        # C11 6.4.3p2: U+D800 to U+DFFF are reserved for surrogate pairs.
        # A codepoint within the range cannot be a valid character.
        if (0xD800 <= c) && (c <= 0xDFFF)
          return false
        end
        # It's not allowed to encode ASCII characters using \U or \u.
        # Some characters not in the basic character set (C11 5.2.1p3)
        # are allowed as exceptions.
        (0xA0 <= c) || (c == '$'.ord) || (c == '@'.ord) || (c == '`'.ord)
      end

      # Reads an octal escape sequence.
      #
      # @param [Char] c
      # @return [Integer]
      def read_octal_char(c)
        r = c.ord - '0'.ord
        if !nextoct?
          return r
        end

        r = (r << 3) | (readc.ord - '0'.ord)
        if !nextoct?
          return r
        end

        (r << 3) | (readc.ord - '0'.ord)
      end

      # @return [Boolean]
      def nextoct?
        ('0'..'7').include?(peek)
      end

      # @return [Token]
      def do_read_token
        if skip_space!
          return Token::SPACE_TOKEN
        end
        mark!
        c = readc
        case c
        when "\n"
          return Token::NEWLINE_TOKEN
        when ':'
          return @token_gen.make_keyword(next?('>') ? ']' : ':')
        when '#'
          return @token_gen.make_keyword(next?('#') ? K::HASHHASH : '#')
        when '+'
          return read_rep2('+', OP::INC, '=', OP::A_ADD, '+')
        when '*'
          return read_rep('=', OP::A_MUL, '*')
        when '='
          return read_rep('=', OP::EQ, '=')
        when '!'
          return read_rep('=', OP::NE, '!')
        when '&'
          return read_rep2('&', OP::LOGAND, '=', OP::A_AND, '&');
        when '|'
          return read_rep2('|', OP::LOGOR, '=', OP::A_OR, '|');
        when '^'
          return read_rep('=', OP::A_XOR, '^')
        when '"'
          return read_string(ENC::NONE)
        when '\''
          return read_char(ENC::NONE)
        when '/'
          return @token_gen.make_keyword(next?('=') ? OP::A_DIV : '/');
        when *'a'..'t', *'v'..'z', *'A'..'K', *'M'..'T', *'V'..'Z', '_', '$', *(0x80.chr..0xFD.chr)
          return read_ident(c)
        when *'0'..'9'
          return read_number(c)
        when 'L', 'U'
          # NOTE: Wide/char32_t character/string literal
          enc = (c == 'L') ? ENC::WCHAR : ENC::CHAR32
          return read_string(enc) if next?('"')
          return read_char(enc)   if next?('\'')
          return read_ident(c)
        when 'u'
          return read_string(ENC::CHAR16) if next?('"')
          return read_char(ENC::CHAR16)   if next?('\'')
          # C11 6.4.5: UTF-8 string literal
          if next?('8')
            if next?('"')
              return read_string(ENC::UTF8)
            end
            unreadc('8')
          end
          return read_ident(c)
        when '.'
          return read_number(c) if Libc.isdigit(peek)
          if next?('.')
            if next?('.')
              return @token_gen.make_keyword(K::ELLIPSIS)
            end
            return @token_gen.make_ident('..')
          end
          return @token_gen.make_keyword('.')
        when '(', ')', ',', ';', '[', ']', '{', '}', '?', '~'
          return @token_gen.make_keyword(c)
        when '-'
          return @token_gen.make_keyword(OP::DEC)   if next?('-')
          return @token_gen.make_keyword(OP::ARROW) if next?('>')
          return @token_gen.make_keyword(OP::A_SUB) if next?('=')
          return @token_gen.make_keyword('-');
        when '<'
          return read_rep('=', OP::A_SAL, OP::SAL) if next?('<')
          return @token_gen.make_keyword(OP::LE)   if next?('=')
          return @token_gen.make_keyword('[')      if next?(':')
          return @token_gen.make_keyword('{')      if next?('%')
          return @token_gen.make_keyword('<')
        when '>'
          return @token_gen.make_keyword(OP::GE)   if next?('=')
          return read_rep('=', OP::A_SAR, OP::SAR) if next?('>')
          return @token_gen.make_keyword('>')
        when '%'
          tok = read_hash_digraph
          return tok if tok
          return read_rep('=', OP::A_MOD, '%')
        when nil
          return Token::EOF_TOKEN
        else
          return @token_gen.make_invalid(c.ord)
        end
      end

      # @return [Char]
      def peek
        r = readc
        unreadc(r)
        r
      end
    end
  end
end
