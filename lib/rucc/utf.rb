module Rucc
  module UTF
    class << self
      # @param(return) [String] b
      # @param [Integer] rune
      def write_utf8(b, rune)
        # In ruby, default encoding is UTF-8, so `String#<<` can append rune
        # as UTF-8 string
        b << rune

        # if rune < 0x80
        #   b << rune
        #   return
        # end
        # if rune < 0x800
        #   b << (0xC0 | (rune >> 6))
        #   b << (0x80 | (rune & 0x3F))
        #   return
        # end
        # if rune < 0x10000
        #   b << (0xE0 | (rune >> 12))
        #   b << (0x80 | ((rune >> 6) & 0x3F))
        #   b << (0x80 | (rune & 0x3F))
        #   return
        # end
        # if rune < 0x200000
        #   b << (0xF0 | (rune >> 18))
        #   b << (0x80 | ((rune >> 12) & 0x3F))
        #   b << (0x80 | ((rune >> 6) & 0x3F))
        #   b << (0x80 | (rune & 0x3F))
        #   return
        # end
        # raise "invalid UCS character: \\U#{format("%08d", rune)}"
        # error("invalid UCS character: \\U%08x", rune);
      end

      # @param [String] str
      # @return [String]
      def to_utf16(str)
        b = ""
        bytes = str.bytes
        while bytes.size > 0
          rune, bytes = read_rune(bytes)
          if rune < 0x10000
            write16(b, rune)
          else
            write16(b, (rune >> 10) + 0xD7C0)
            write16(b, (rune & 0x3FF) + 0xDC00)
          end
        end
        b
      end

      # @param [String] str
      # @return [String]
      def to_utf32(str)
        b = ""
        bytes = str.bytes
        while bytes.size > 0
          rune, bytes = read_rune(bytes)
          write32(b, rune)
        end
        b
      end

      # @param(return) [String] b
      # @param [Integer] rune
      def write16(b, rune)
        b << (rune & 0xFF)
        b << (rune >> 8)
      end

      # @param(return) [String] b
      # @param [Integer] rune
      def write32(b, rune)
        write16(b, rune & 0xFFFF)
        write16(b, rune >> 16)
      end

      # @param [<Integer>] s
      # @return [<Integer, <Integer>>]
      def read_rune(s)
        len = count_leading_ones(s[0])
        if len == 0
          return s[0], s[1..-1]
        end
        if len > s.size
          raise "invalid UTF-8 sequence"
          # error("invalid UTF-8 sequence");
        end
        1.upto(len - 1).each do |i|
          if (s[i] & 0xC0) != 0x80
            raise "invalid UTF-8 continuation byte"
            # error("invalid UTF-8 continuation byte");
          end
        end

        case len
        when 2
          r = ((s[0] & 0x1F) << 6) | (s[1] & 0x3F)
          return r, s[2..-1]
        when 3
          r = ((s[0] & 0xF) << 12) | ((s[1] & 0x3F) << 6) | (s[2] & 0x3F)
          return r, s[3..-1]
        when 4
          r = ((s[0] & 0x7) << 18) | ((s[1] & 0x3F) << 12) | ((s[2] & 0x3F) << 6) | (s[3] & 0x3F)
          return r, s[4..-1]
        else
          raise "invalid UTF-8 sequence"
          # error("invalid UTF-8 sequence");
        end
      end

      # @param [Integer] c
      # @return [Integer]
      def count_leading_ones(c)
        7.downto(0).each do |i|
          if (c & (1 << i)) == 0
            return 7 - i
          end
        end
        8
      end
    end
  end
end
