require "rucc/kind"
require "rucc/type/check"
require "rucc/type/conv"

module Rucc
  class Type
    extend Check
    extend Conv

    # @param [Kind] kind the kind of type
    # @param [Integer] size
    # @param [Integer] align
    # @param [Boolean] usig true if unsigned
    # @param [Integer] len array length
    def initialize(kind,
                   size: nil, align: nil, usig: nil, isstatic: nil,
                   ptr: nil,                                             # Pointer or Array
                   len: nil,                                             # Array
                   fields: nil, offset: nil,                             # Struct
                   is_struct: nil,                                       # true if Struct, false if Union
                   bitoff: nil, bitsize: nil,                            # Bitfield
                   rettype: nil, params: nil, hasva: nil, oldstyle: nil  # Function
                  )
      @kind = kind
      @size = size; @align = align; @usig = usig; @isstatic = isstatic
      @ptr = ptr                                                                  # Pointer or Array
      @len = len                                                                  # Array
      @fields = fields; @offset = offset                                          # Struct
      @is_struct = is_struct                                                      # true if Struct, false if Union
      @bitoff = bitoff; @bitsize = bitsize                                        # Bitfield
      @rettype = rettype; @params = params; @hasva = hasva; @oldstyle = oldstyle  # Function
    end
    attr_reader :kind,
                :size, :align, :usig, :isstatic,
                :ptr,                                 # Pointer or Array
                :len,                                 # Array
                :fields, :offset,                     # Struct
                :is_struct,                           # true if Struct, false if Union
                :bitoff, :bitsize,                    # Bitfield
                :rettype, :params, :hasva, :oldstyle  # Function
    attr_writer :isstatic, :params, :hasva,
                :size, :align, :usig,
                :ptr,                                 # Pointer or Array
                :len,                                 # Array
                :fields, :offset,                     # Struct
                :bitoff, :bitsize                     # Bitfield

    # @return [String]
    def to_s
      to_s_impl({})
    end

    # @param [Hash] dict
    # @return [String]
    def to_s_impl(dict)
      # TODO(south37) Consider nil case
      # if (!ty)
      #     return "(nil)";
      case kind
      when Kind::VOID    then return "void"
      when Kind::BOOL    then return "_Bool"
      when Kind::CHAR    then return decorate_int("char")
      when Kind::SHORT   then return decorate_int("short")
      when Kind::INT     then return decorate_int("int")
      when Kind::LONG    then return decorate_int("long")
      when Kind::LLONG   then return decorate_int("llong")
      when Kind::FLOAT   then return "float"
      when Kind::DOUBLE  then return "double"
      when Kind::LDOUBLE then return "long double"
      when Kind::PTR
        return "*#{ptr.to_s_impl(dict)}"
      when Kind::ARRAY
        return "[#{len}]#{ptr.to_s_impl(dict)}"
      when Kind::STRUCT
        k = is_struct ? "struct" : "union"
        if !dict[self.object_id].nil?
          return "(#{k})"
        end
        dict[self.object_id] = true
        if fields
          s = "(#{k}"
          fields.each do |_, fieldtype|
            s << " (#{fieldtype.to_s_impl(dict)})"
          end
          s << ")"
          return s
        end
        raise "Must not reach here"  # TODO(south37) Confirm occurance
      when Kind::FUNC
        s = "("
        if params
          s << params.map { |param| param.to_s_impl(dict) }.join(",")
        end
        s << ")=>#{rettype.to_s_impl(dict)}"
        return s
      else
        return "(Unknown ty: #{kind})"
      end
    end

    # @param [String] name
    # @return [String]
    def decorate_int(name)
      u = usig ? "u" : ""
      if bitsize && bitsize > 0
        return "#{u}#{name}:#{bitoff}:#{bitoff + bitsize}"
      end
      "#{u}#{name}"
    end

    # @param [Type] tmpl
    def replace_by!(tmpl)
      tmpl.instance_variables.each do |ivar|
        self.instance_variable_set(ivar, tmpl.instance_variable_get(ivar))
      end
    end

    class << self
      # @param [Type] ty
      # @return [Type]
      def make_ptr_type(ty)
        Type.new(Kind::PTR,
                 ptr:   ty,
                 size:  8,
                 align: 8)
      end

      # @param [Type] ty
      # @param [Integer] len
      # @return [Type]
      def make_array_type(ty, len)
        if len < 0
          size = -1
        else
          size = ty.size * len
        end
        Type.new(Kind::ARRAY,
                 ptr:   ty,
                 size:  size,
                 len:   len,
                 align: ty.align)
      end

      # @param [Type] rettype
      # @param [Array] paramtypes
      # @param [Boolean] has_varargs
      # @param [Boolean] oldstyle
      # @return [Type]
      def make_func_type(rettype, paramtypes, has_varargs, oldstyle)
        Type.new(Kind::FUNC,
                 rettype:  rettype,
                 params:   paramtypes,
                 hasva:    has_varargs,
                 oldstyle: oldstyle)
      end

      # @param [Kind] kind
      # @param [Boolean] usig
      # @return [Type]
      def make_numtype(kind, usig)
        size = align =
          case kind
          when Kind::VOID    then 0
          when Kind::BOOL    then 1
          when Kind::CHAR    then 1
          when Kind::SHORT   then 2
          when Kind::INT     then 4
          when Kind::LONG    then 8
          when Kind::LLONG   then 8
          when Kind::FLOAT   then 4
          when Kind::DOUBLE  then 8
          when Kind::LDOUBLE then 8
          else
            raise "internal error"
          end
        Type.new(kind, size: size, align: align, usig: usig)
      end

      # @return [Type]
      def make_stub_type
        Type.new(Kind::STUB, size: 0)
      end

      # @param [Boolean] is_struct
      # @return [Type]
      def make_rectype(is_struct)
        Type.new(Kind::STRUCT, is_struct: is_struct)
      end

      # @param [ENC]
      # @return [Type]
      def char_type(enc)
        case enc
        when ENC::NONE, ENC::WCHAR
          return Type::INT
        when ENC::CHAR16
          return Type::USHORT
        when ENC::CHAR32
          return Type::UINT
        else
          raise "internal error"
        end
      end

      # @param [Type] t
      # @param [Type] u
      # @return [Boolean]
      def same_arith_type(t, u)
        t.kind == u.kind && t.usig == u.usig
      end

      # @param [Type] totype
      # @param [Type] fromtype
      def ensure_assignable!(totype, fromtype)
        if (Type.is_arithtype(totype) || (totype.kind == Kind::PTR)) &&
            (Type.is_arithtype(fromtype) || (fromtype.kind == Kind::PTR))
          return
        end
        if is_same_struct?(totype, fromtype)
          return
        end
        raise "incompatible kind: <#{totype}> <#{fromtype}>"
      end

      # @param [Type] a
      # @param [Type] b
      # @return [Boolean]
      def is_same_struct?(a, b)
        if a.kind != b.kind
          return false
        end

        case a.kind
        when Kind::ARRAY
          return a.len == b.len && is_same_struct?(a.ptr, b.ptr)
        when Kind::PTR
          return is_same_struct?(a.ptr, b.ptr)
        when Kind::STRUCT
          if a.is_struct != b.is_struct
            return false
          end
          ka = a.fields.values
          kb = b.fields.values
          if ka.size != kb.size
            return false
          end
          ka.zip(kb).each do |(x, y)|
            if !is_same_struct?(x, y)
              return false
            end
          end
          return true
        else
          return true
        end
      end

      # @param [Type] a
      # @param [Type] b
      # @return [Boolean]
      def type_compatible?(a, b)
        if a.kind == Kind::STRUCT
          return is_same_struct?(a, b)
        end
        if a.kind != b.kind
          return false
        end
        if a.ptr && b.ptr
          return type_compatible?(a.ptr, b.ptr)
        end
        if is_arithtype(a) && is_arithtype(b)
          return same_arith_type(a, b)
        end
        true
      end

      # @param [Type, NilClass] ty
      # @return [Type, NilClass]
      def copy_incomplete_type(ty)
        return nil if ty.nil?
        (ty.len == -1) ? ty.dup : ty
      end
    end

    # Objects representing basic types. All variables will be of one of these
    # types or a derived type from one of them.
    VOID    = Type.new(Kind::VOID,    size: 0, align: 0, usig: false)
    BOOL    = Type.new(Kind::BOOL,    size: 1, align: 1, usig: true)
    CHAR    = Type.new(Kind::CHAR,    size: 1, align: 1, usig: false)
    SHORT   = Type.new(Kind::SHORT,   size: 2, align: 2, usig: false)
    INT     = Type.new(Kind::INT,     size: 4, align: 4, usig: false)
    LONG    = Type.new(Kind::LONG,    size: 8, align: 8, usig: false)
    LLONG   = Type.new(Kind::LLONG,   size: 8, align: 8, usig: false)
    UCHAR   = Type.new(Kind::CHAR,    size: 1, align: 1, usig: true)
    USHORT  = Type.new(Kind::SHORT,   size: 2, align: 2, usig: true)
    UINT    = Type.new(Kind::INT,     size: 4, align: 4, usig: true)
    ULONG   = Type.new(Kind::LONG,    size: 8, align: 8, usig: true)
    ULLONG  = Type.new(Kind::LLONG,   size: 8, align: 8, usig: true)
    FLOAT   = Type.new(Kind::FLOAT,   size: 4, align: 4, usig: false)
    DOUBLE  = Type.new(Kind::DOUBLE,  size: 8, align: 8, usig: false)
    LDOUBLE = Type.new(Kind::LDOUBLE, size: 8, align: 8, usig: false)
    ENUM    = Type.new(Kind::ENUM,    size: 4, align: 4, usig: false)
  end
end
