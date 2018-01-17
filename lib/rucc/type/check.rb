module Rucc
  class Type
    module Check
      # @param [Type] ty
      # @return [Boolean]
      def is_arithtype(ty)
        is_inttype(ty) || is_flotype(ty)
      end

      # @param [Type] ty
      # @return [Boolean]
      def is_inttype(ty)
        case ty.kind
        when Kind::BOOL, Kind::CHAR, Kind::SHORT, Kind::INT, Kind::LONG, Kind::LLONG
          true
        else
          false
        end
      end

      # @param [Type] ty
      # @return [Boolean]
      def is_flotype(ty)
        case ty.kind
        when Kind::FLOAT, Kind::DOUBLE, Kind::LDOUBLE
          true
        else
          false
        end
      end

      # @param [Type] ty
      # @return [Boolean]
      def is_string(ty)
        ty.kind == Kind::ARRAY && ty.ptr.kind == Kind::CHAR
      end
    end
  end
end
