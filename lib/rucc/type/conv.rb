require "rucc/util"

module Rucc
  class Type
    module Conv
      # C11 6.3.1.8: Usual arithmetic conversions
      # @param [Type] t
      # @param [Type] u
      # @return [Type]
      def usual_arith_conv(t, u)
        Util.assert!{ Type.is_arithtype(t) }
        Util.assert!{ Type.is_arithtype(u) }
        if (t.kind < u.kind)
          # Make t the larger type
          t, u = u, t
        end
        return t if Type.is_flotype(t)
        Util.assert!{ Type.is_inttype(t) && t.size >= Type::INT.size }
        Util.assert!{ Type.is_inttype(u) && u.size >= Type::INT.size }
        return t if t.size > u.size
        Util.assert!{ t.size == u.size }
        return t if t.usig == u.usig
        r = t.dup
        r.usig = true
        r
      end
    end
  end
end
