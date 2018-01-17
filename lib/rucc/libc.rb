module Rucc
  # Emulate libc
  module Libc
    class << self
      # same with isspace in libc
      # @param [Char] c
      def isspace(c)
        "\x20\x0c\x0a\x0d\x09\x0b".freeze.include?(c)
      end

      # same with isdigit in libc
      # @param [Char] c
      def isdigit(c)
        "0123456789".freeze.include?(c)
      end

      # same with isdigit in libc
      # @param [Char] c
      def isxdigit(c)
        "0123456789abcdefABCDEF".freeze.include?(c)
      end

      # same with isalpha in libc
      # @param [Char] c
      def isalpha(c)
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".freeze.include?(c)
      end

      # same with isalnum in libc
      # @param [Char] c
      def isalnum(c)
        "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".freeze.include?(c)
      end

      # TODO(south37) Impl same logic with ispunct in libc
      # @param [Char] c
      def ispunct(c)
        '!"#$%&\'()*+,-./:;<=>?@[\]^_`{|}~'.include?(c)
      end

      # TODO(south37) Impl same logic with isprint in libc
      def isprint(c)
        isalnum(c) || ispunct(c) || isspace(c)
      end
    end
  end
end
