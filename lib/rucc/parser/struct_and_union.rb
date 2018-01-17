module Rucc
  class Parser
    module StructAndUnion
    private

      # @param [Node] struct
      def read_struct_field(struct)
        if struct.ty.kind != Kind::STRUCT
          raise "struct expected, but got #{struct}"
        end
        name = get
        if name.kind != T::IDENT
          raise "field name expected, but got #{name}"
        end
        field = struct.ty.fields[name.sval]
        if field.nil?
          raise "struct has no such field: #{name}"
        end
        Node.ast_struct_ref(field, struct, name.sval)
      end

      # @return [Type]
      def read_struct_def
        read_rectype_def(true)
      end

      # @return [Type]
      def read_union_def
        read_rectype_def(false)
      end

      # @param [Boolean] is_struct
      # @return [Type]
      def read_rectype_def(is_struct)
        tag = read_rectype_tag
        if !tag.nil?
          r = @tags[tag]
          if r && ((r.kind == Kind::ENUM) || (r.is_struct != is_struct))
            raise "declarations of #{tag} does not match"
          end
          if r.nil?
            r = Type.make_rectype(is_struct)
            @tags[tag] = r
          end
        else
          r = Type.make_rectype(is_struct)
        end
        size = 0
        align = 1
        size, align, fields = read_rectype_fields(size, align, is_struct)
        r.align = align
        if !fields.nil?
          r.fields = fields
          r.size = size
        end
        r
      end

      # @return [String]
      def read_rectype_tag
        tok = get
        if tok.kind == T::IDENT
          return tok.sval
        end
        @lexer.unget_token(tok)
        nil
      end

      # @param [Integer] rsize
      # @param [Integer] align
      # @parsm [Boolean] is_struct
      # @return [<Integer, Integer, Hash>]
      def read_rectype_fields(rsize, align, is_struct)
        if !next_token?('{')
          return rsize, align, nil
        end
        fields = read_rectype_fields_sub
        fix_rectype_flexible_member(fields)
        if is_struct
          return update_struct_offset(rsize, align, fields)
        end
        update_union_offset(rsize, align, fields)
      end

      # @return [Array]
      def read_rectype_fields_sub
        r = []
        while true
          if next_token?(K::STATIC_ASSERT)
            read_static_assert
            next
          end
          if !is_type?(peek)
            break
          end
          basetype, _ = read_decl_spec
          if (basetype.kind == Kind::STRUCT) && next_token?(';')
            r.push(["", basetype])
            next
          end
          while true
            name = ""
            fieldtype = read_declarator(name, basetype, nil, DECL::PARAM_TYPEONLY)
            ensure_not_void!(fieldtype)
            fieldtype = fieldtype.dup
            fieldtype.bitsize = next_token?(':') ? read_bitsize(name, fieldtype) : -1
            r.push([name, fieldtype])
            if next_token?(',')
              next
            end
            if Token.is_keyword?(peek, '}')
              # TODO(south37) Impl warnt when necessary
              # warnt(peek(), "missing ';' at the end of field list");
            else
              expect!(';')
            end
            break
          end
        end
        expect!('}')
        r
      end

      def fix_rectype_flexible_member(fields)
        fields.each_with_index do |pair, i|
          name = pair[0]
          ty   = pair[1]
          next if ty.kind != Kind::ARRAY
          if ty.len == -1
            if i != (fields.size - 1)
              raise "flexible member may only appear as the last member: #{ty} #{name}"
            end
            if fields.size == 1
              raise "flexible member with no other fields: #{ty} #{name}"
            end
            ty.len = 0;
            ty.size = 0;
          end
        end
      end

      # @param [Integer] rsize
      # @param [Integer] align
      # @param [Array] fields
      # @return [<Integer, Integer, Hash>]
      def update_struct_offset(rsize, align, fields)
        off = 0
        bitoff = 0
        r = {}
        fields.each do |(name, fieldtype)|
          # C11 6.7.2.1p14: Each member is aligned to its natural boundary.
          # As a result the entire struct is aligned to the largest among its members.
          # Unnamed fields will never be accessed, so they shouldn't be taken into account
          # when calculating alignment.
          if name != ""
            align = [align, fieldtype.align].max
          end

          if name == "" && (fieldtype.kind == Kind::STRUCT)
            # C11 6.7.2.1p13: Anonymous struct
            off, bitoff = finish_bitfield(off, bitoff)
            off += compute_padding(off, fieldtype.align)
            squash_unnamed_struct(r, fieldtype, off)
            off += fieldtype.size
            next
          end

          if fieldtype.bitsize == 0
            # C11 6.7.2.1p12: The zero-size bit-field indicates the end of the
            # current run of the bit-fields.
            off, bitoff = finish_bitfield(off, bitoff)
            off += compute_padding(off, fieldtype.align)
            bitoff = 0
            next
          end

          if fieldtype.bitsize && fieldtype.bitsize > 0
            bit = fieldtype.size * 8
            room = bit - ((off * 8 + bitoff) % bit)
            if fieldtype.bitsize <= room
              fieldtype.offset = off
              fieldtype.bitoff = bitoff
            else
              off, bitoff = finish_bitfield(off, bitoff)
              off += compute_padding(off, fieldtype.align)
              fieldtype.offset = off
              fieldtype.bitoff = 0
            end
            bitoff += fieldtype.bitsize
          else
            off, bitoff = finish_bitfield(off, bitoff)
            off += compute_padding(off, fieldtype.align)
            fieldtype.offset = off
            off += fieldtype.size
          end

          if name != ""
            r[name] = fieldtype
          end
        end
        off, bitoff = finish_bitfield(off, bitoff)
        rsize = off + compute_padding(off, align)
        return rsize, align, r
      end

      # @param [Integer] rsize
      # @param [Integer] align
      # @param [Array] fields
      # @return [<Integer, Integer, Hash>]
      def update_union_offset(rsize, align, fields)
        maxsize = 0
        r = {}
        fields.each do |(name, fieldtype)|
          maxsize = [maxsize, fieldtype.size].max
          align = [align, fieldtype.align].max
          if name == "" && (fieldtype.kind == Kind::STRUCT)
            squash_unnamed_struct(r, fieldtype, 0)
            next
          end
          fieldtype.offset = 0
          if fieldtype.bitsize.nil? || fieldtype.bitsize >= 0
            fieldtype.bitoff = 0
          end
          if name
            r[name] = fieldtype
          end
        end
        rsize = maxsize + compute_padding(maxsize, align)
        return rsize, align, r
      end

      # @param [Integer] off
      # @param [Integer] bitoff
      # @return [<Integer, Integer>] off, bitoff
      def finish_bitfield(off, bitoff)
        off += (bitoff + 7) / 8
        bitoff = 0
        return off, bitoff
      end

      # @param [Integer] off
      # @param [Integer] align
      # @return [Integer]
      def compute_padding(offset, align)
        ((offset % align) == 0) ? 0 : (align - (offset % align))
      end

      # @param [String] name
      # @param [Type] ty
      # @return [integer]
      def read_bitsize(name, ty)
        if !Type.is_inttype(ty)
          raise "non-integer type cannot be a bitfield: #{ty}"
        end
        tok = peek
        r = read_intexpr
        maxsize = ty.kind == Kind::BOOL ? 1 : ty.size * 8
        if (r < 0) || (maxsize < r)
          raise "#{tok}: invalid bitfield size for #{ty}: #{r}"
          # TODO(south37) Impl errort when necessary
          # errort(tok, "invalid bitfield size for %s: %d", ty2s(ty), r);
        end
        if (r == 0) && name != ""
          raise "#{tok}: zero-width bitfield needs to be unnamed: #{name}"
          # TODO(south37) Impl errort when necessary
          # errort(tok, "zero-width bitfield needs to be unnamed: %s", name);
        end
        r
      end

      # @param [Hash] dict
      # @param [Type] unnamed
      # @param [Integer] offset
      def squash_unnamed_struct(dict, unnamed, offset)
        keys = unnamed.fields.keys
        keys.each do |name|
          t = unnamed.fields[name].dup
          t.offset += offset
          dict[name] = t
        end
      end
    end
  end
end
