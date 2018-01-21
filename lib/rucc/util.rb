module Rucc
  module Util
    class << self
      ##
      # Quote
      ##

      # @param [Char] c
      # @return [char, NilClass] nil when c is not escapetable
      def quote(c)
        case c
        when '"'  then '\\"'
        when "\\" then '\\\\'
        when "\b" then '\\b'
        when "\f" then '\\f'
        when "\n" then '\\n'
        when "\r" then '\\r'
        when "\t" then '\\t'
        when "\v" then '\\x0b'
        else           nil
        end
      end

      # @param(return) [String] b
      # @param [Char] c
      def quote_append(b, c)
        q = quote(c)
        if q
          b << q
        elsif Libc.isprint(c)
          b << c
        else
          # TODO(south37) Fix this dirty hack.
          # In current impl, "\u00ff" (utf-8 two byte string) and "\xff" (one byte string) can not be distinguished.
          # By using byte array from the beginning, these can be expressed differently.
          if c.ord <= 0xff
            # One byte
            b << ("\\x%02x" % c.ord)
          else
            # Multi bytes
            c.bytes.each do |byte|
              b << ("\\x%02x" % byte)
            end
          end
        end
      end

      # @param [String] str
      # @param [Char] c
      # @return [String]
      def quote_cstring(str)
        b = ""
        while (c = str[0])
          quote_append(b, c)
          str = str[1..-1]
        end
        b
      end

      # @param [Integer] c
      def quote_char(c)
        return "\\\\" if c == '\\'.ord
        return "\\'"  if c == '\''.ord
        "%c" % c
      end

      # @param [Integer] n
      # @return [Integer]
      def ceil8(n)
        rem = n % 8
        (rem == 0) ? n : (n - rem + 8)
      end

      ##
      # Error
      ##

      # @param [Token] tok
      # @param [String] message
      # @raise [RuntimeError]
      def errort!(tok, message)
        raise_error(token_pos(tok), "ERROR", message)
      end

      # @param [Token] tok
      # @return [String]
      def token_pos(tok)
        f = tok.file
        if !f
          return "(unknown)"
        end
        name = f.name || "(unknown)"
        "#{name}:#{tok.line}:#{tok.column}"
      end

      def raise_error(pos, label, message)
        raise "[#{label}] #{pos}: #{message}"
      end

      ##
      # Assert
      ##

      class AssertError < RuntimeError; end

      def assert!(&block)
        raise AssertError.new("Assertion failed!") if !block.call
      end
    end
  end
end
