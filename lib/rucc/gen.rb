require "rucc/int_evaluator"

module Rucc
  class Gen
    REGS  = ["rdi", "rsi", "rdx", "rcx", "r8", "r9"].freeze
    SREGS = ["dil", "sil", "dl", "cl", "r8b", "r9b"].freeze
    MREGS = ["edi", "esi", "edx", "ecx", "r8d", "r9d"].freeze

    # @param [IO] output
    # @param [LabelGen] label_gen
    def initialize(output, label_gen)
      @output    = output
      @label_gen = label_gen

      @stackpos = nil

      # number of float and int
      @numgp = nil
      @numfp = nil
    end

    # @param [Node] v
    def emit_toplevel(v)
      @stackpos = 8
      if v.kind == AST::FUNC
        emit_func_prologue(v)
        emit_expr(v.body)
        emit_ret
      elsif v.kind == AST::DECL
        emit_global_var(v)
      else
        raise "internal error"
      end
    end

  private

    # @param [String] fmt
    def emit(fmt, *args)
      emit_noindent("\t#{fmt}", *args)
    end

    # @param [String] fmt
    def emit_noindent(fmt, *args)
      # Replace "#" with "%%" so that vfprintf prints out "#" as "%".
      @output.printf(fmt.gsub('#', '%%'), *args)
      # TODO(south37) Impl dumpstack when necessary
      # if (dumpstack) {
      #     for (char *p = fmt; *p; p++)
      #         if (*p == '\t')
      #             col += TAB - 1;
      #     int space = (28 - col) > 0 ? (30 - col) : 2;
      #     fprintf(outputfp, "%*c %s:%d", space, '#', get_caller_list(), line);
      # }
      @output.print("\n")
    end

    # @param [String] label
    def emit_label(label)
      emit("#{label}:")
    end

    # @param [Integer] n
    # @param [Integer] m
    # @return [Integer]
    def align(n, m)
      rem = n % m
      return (rem == 0) ? n : (n - rem + m)
    end

    # @param [Integer] reg
    def push_xmm(reg)
      # TODO(south37) Impl SAVE when necessary
      # SAVE
      emit("sub $8, #rsp")
      emit("movsd #xmm#{reg}, (#rsp)")
      @stackpos += 8
    end

    # @param [Integer] reg
    def pop_xmm(reg)
      # TODO(south37) Impl SAVE when necessary
      # SAVE
      emit("movsd (#rsp), #xmm#{reg}")
      emit("add $8, #rsp");
      @stackpos -= 8;
      Util.assert!{ @stackpos >= 0 }
    end

    # @param [String] reg
    def push(reg)
      # TODO(south37) Impl SAVE when necessary
      # SAVE
      emit("push ##{reg}")

      @stackpos += 8
    end

    # @param [String] reg
    def pop(reg)
      # TODO(south37) Impl SAVE when necessary
      # SAVE
      emit("pop ##{reg}")
      @stackpos -= 8
      Util.assert!{ @stackpos >= 0 }
    end

    # @param [Node] func
    def emit_func_prologue(func)
      # TODO(south37) Impl SAVE when necessary
      # SAVE
      emit(".text");
      if !func.ty.isstatic
        emit_noindent(".global #{func.fname}")
      end
      emit_noindent("#{func.fname}:")
      emit("nop")
      push("rbp")
      emit("mov #rsp, #rbp")
      off = 0
      if func.ty.hasva
        set_reg_nums(func.params)
        off -= emit_regsave_area
      end
      push_func_params(func.params, off)
      off -= func.params.size * 8

      localarea = 0
      func.localvars.each do |v|
        size = align(v.ty.size, 8)
        Util.assert!{ size % 8 == 0 }
        off -= size
        v.loff = off
        localarea += size
      end
      if localarea > 0
        emit("sub $#{localarea}, #rsp")
        @stackpos += localarea
      end
    end

    # @param [<Node>] args
    def set_reg_nums(args)
      @numgp = @numfp = 0
      args.each do |arg|
        if Type.is_flotype(arg.ty)
          @numfp += 1
        else
          @numgp += 1
        end
      end
    end

    REGAREA_SIZE = 176

    # @return [Integer]
    def emit_regsave_area
      emit("sub $#{REGAREA_SIZE}, #rsp")
      emit("mov #rdi, (#rsp)")
      emit("mov #rsi, 8(#rsp)")
      emit("mov #rdx, 16(#rsp)")
      emit("mov #rcx, 24(#rsp)")
      emit("mov #r8, 32(#rsp)")
      emit("mov #r9, 40(#rsp)")
      emit("movaps #xmm0, 48(#rsp)")
      emit("movaps #xmm1, 64(#rsp)")
      emit("movaps #xmm2, 80(#rsp)")
      emit("movaps #xmm3, 96(#rsp)")
      emit("movaps #xmm4, 112(#rsp)")
      emit("movaps #xmm5, 128(#rsp)")
      emit("movaps #xmm6, 144(#rsp)")
      emit("movaps #xmm7, 160(#rsp)")
      REGAREA_SIZE
    end

    # @param [Array] params
    # @param [Integer] off
    def push_func_params(params, off)
      ireg = 0
      xreg = 0
      arg = 2
      params.each do |v|
        if v.ty.kind == Kind::STRUCT
          emit("lea #{arg * 8}(#rbp), #rax")
          size = push_struct(v.ty.size)
          off -= size
          arg += (size / 8)
        elsif Type.is_flotype(v.ty)
          if xreg >= 8
            emit("mov %d(#rbp), #rax", arg * 8)
            arg += 1
            push("rax")
          else
            push_xmm(xreg)
            xreg += 1
          end
          off -= 8
        else
          if ireg >= 6
            if v.ty.kind == Kind::BOOL
              emit("mov #{arg * 8}(#rbp), #al")
              arg += 1
              emit("movzb #al, #eax")
            else
              emit("mov #{arg * 8}(#rbp), #rax")
              arg += 1
            end
            push("rax")
          else
            if v.ty.kind == Kind::BOOL
              emit("movzb ##{SREGS[ireg]}, ##{MREGS[ireg]}")
            end
            push(REGS[ireg])
            ireg += 1
          end
          off -= 8
        end
        v.loff = off
      end
    end

    # @param [Integer] size
    # @return [Integer]
    def push_struct(size)
      # TODO(south37) Impl SAVE when necessary
      # SAVE;
      aligned = align(size, 8)
      emit("sub $#{aligned}, #rsp")
      emit("mov #rcx, -8(#rsp)")
      emit("mov #r11, -16(#rsp)")
      emit("mov #rax, #rcx")
      i = 0
      while i < size
        emit("movq #{i}(#rcx), #r11")
        emit("mov #r11, #{i}(#rsp)")
        i += 8
      end
      while i < size
        emit("movl #{i}(#rcx), #r11")
        emit("movl #r11d, #{i}(#rsp)")
        i += 4
      end
      while i < size
        emit("movb %d(#rcx), #r11", i)
        emit("movb #r11b, %d(#rsp)", i)
        i += 1
      end
      emit("mov -8(#rsp), #rcx")
      emit("mov -16(#rsp), #r11")
      @stackpos += aligned
      aligned
    end

    # @param [Node] node
    def emit_expr(node)
      # TODO(south37) Impl SAVE when necessary
      # SAVE
      # maybe_print_source_loc(node)
      case node.kind
      when AST::LITERAL          then emit_literal(node)
      when AST::LVAR             then emit_lvar(node)
      when AST::GVAR             then emit_gvar(node)
      when AST::FUNCDESG         then emit_addr(node)
      when AST::FUNCALL
        return if maybe_emit_builtin(node)
        emit_func_call(node)
      when AST::FUNCPTR_CALL     then emit_func_call(node)
      when AST::DECL             then emit_decl(node)
      when AST::CONV             then emit_conv(node)
      when AST::ADDR             then emit_addr(node.operand)
      when AST::DEREF            then emit_deref(node)
      when AST::IF, AST::TERNARY then emit_ternary(node)
      when AST::GOTO             then emit_goto(node)
      when AST::LABEL            then (emit_label(node.newlabel) if node.newlabel)
      when AST::RETURN           then emit_return(node)
      when AST::COMPOUND_STMT    then emit_compound_stmt(node)
      when AST::STRUCT_REF       then emit_load_struct_ref(node.struct, node.ty, 0)
      when OP::PRE_INC           then emit_pre_inc_dec(node, "add")
      when OP::PRE_DEC           then emit_pre_inc_dec(node, "sub")
      when OP::POST_INC          then emit_post_inc_dec(node, "add")
      when OP::POST_DEC          then emit_post_inc_dec(node, "sub")
      when '!'                   then emit_lognot(node)
      when '&'                   then emit_bitand(node)
      when '|'                   then emit_bitor(node)
      when '~'                   then emit_bitnot(node)
      when OP::LOGAND            then emit_logand(node)
      when OP::LOGOR             then emit_logor(node)
      when OP::CAST              then emit_cast(node)
      when ','                   then emit_comma(node)
      when '='                   then emit_assign(node)
      when OP::LABEL_ADDR        then emit_label_addr(node)
      when AST::COMPUTED_GOTO    then emit_computed_goto(node)
      else                            emit_binop(node)
      end
    end

    # @param [Node] node
    def emit_literal(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE
      case node.ty.kind
      when Kind::BOOL, Kind::CHAR, Kind::SHORT
        emit("mov $%u, #rax" % node.ival)
      when Kind::INT
        emit("mov $%u, #rax" % node.ival)
      when Kind::LONG, Kind::LLONG
        emit("mov $%u, #rax" % node.ival)
      when Kind::FLOAT
        if !node.flabel
          node.flabel = @label_gen.next
          emit_noindent(".data")
          emit_label(node.flabel)
          emit(".long #{[node.fval].pack('f').unpack('I')[0]}")
          emit_noindent(".text")
        end
        emit("movss #{node.flabel}(#rip), #xmm0")
      when Kind::DOUBLE, Kind::LDOUBLE
        if !node.flabel
          node.flabel = @label_gen.next
          emit_noindent(".data")
          emit_label(node.flabel)
          emit(".quad #{[node.fval].pack('d').unpack('Q')[0]}")
          emit_noindent(".text")
        end
        emit("movsd #{node.flabel}(#rip), #xmm0")
      when Kind::ARRAY
        if !node.slabel
          node.slabel = @label_gen.next
          emit_noindent(".data")
          emit_label(node.slabel)
          emit(".string \"%s\"", Util.quote_cstring(node.sval))
          emit_noindent(".text")
        end
        emit("lea #{node.slabel}(#rip), #rax")
      else
        raise "internal error"
      end
    end

    # @param [Node] node
    def emit_lvar(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      ensure_lvar_init(node)
      emit_lload(node.ty, "rbp", node.loff)
    end

    # @param [Node] node
    def emit_gvar(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      emit_gload(node.ty, node.glabel, 0)
    end

    # @param [Type] ty
    # @param [String] label
    # @param [Integer] off
    def emit_gload(ty, label, off)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      if ty.kind == Kind::ARRAY
        if off > 0
          emit("lea %s+#{off}(#rip), #rax", label)
        else
          emit("lea %s(#rip), #rax", label)
        end
        return
      end
      inst = get_load_inst(ty)
      emit("#{inst} %s+#{off}(#rip), #rax", label)
      maybe_emit_bitshift_load(ty)
    end

    # @param [Node] v
    def emit_global_var(v)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      if v.declinit
        emit_data(v, 0, 0)
      else
        emit_bss(v)
      end
    end

    # @param [Node] v
    # @param [Integer] off
    # @param [Integer] depth
    def emit_data(v, off, depth)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      emit(".data #{depth}")
      if !v.declvar.ty.isstatic
        emit_noindent(".global #{v.declvar.glabel}")
      end
      emit_noindent("#{v.declvar.glabel}:")
      do_emit_data(v.declinit, v.declvar.ty.size, off, depth)
    end

    # @param [Array] inits
    # @param [Integer] size
    # @param [Integer] off
    # @param [Integer] depth
    def do_emit_data(inits, size, off, depth)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      i = 0
      while (i < inits.size && 0 < size)
        node = inits[i]
        v = node.initval
        emit_padding(node, off)
        if node.totype.bitsize && (node.totype.bitsize > 0)
          Util.assert!{ node.totype.bitoff == 0 }
          data = IntEvaluator.eval(v).first
          totype = node.totype
          while (i < inits.size)
            node = inits[i]
            if node.totype.bitsize.nil? || (node.totype.bitsize <= 0)
              break
            end
            v = node.initval
            totype = node.totype
            data |= (((1 << totype.bitsize) - 1) & IntEvaluator.eval(v).first) << totype.bitoff
            i += 1
          end
          emit_data_primtype(totype, Node.new(AST::LITERAL, ty: totype, ival: data), depth)
          off += totype.size
          size -= totype.size
          break if i == inits.size
        else
          off += node.totype.size
          size -= node.totype.size
        end
        if v.kind == AST::ADDR
          emit_data_addr(v.operand, depth)
          i += 1
          next
        end
        if (v.kind == AST::LVAR) && v.lvarinit
          do_emit_data(v.lvarinit, v.ty.size, 0, depth)
          i += 1
          next
        end
        emit_data_primtype(node.totype, node.initval, depth)
        i += 1
      end
      emit_zero(size)
    end

    # @param [Node] node
    # @param [Intyeger] off
    def emit_padding(node, off)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      diff = node.initoff - off
      Util.assert!{ diff >= 0 }
      emit_zero(diff)
    end

    # @param [Integer] size
    def emit_zero(size)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      while (size >= 8) do
        emit(".quad 0")
        size -= 8
      end
      while (size >= 4) do
        emit(".long 0")
        size -= 4
      end
      while (size > 0) do
        emit(".byte 0")
        size -= 1
      end
    end

    # @param [Type] ty
    # @param [Node] val
    # @param [Integer] depth
    def emit_data_primtype(ty, val, depth)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      case ty.kind
      when Kind::FLOAT
        emit(".long #{[val.fval].pack('f').unpack('I')[0]}")
      when Kind::DOUBLE
        emit(".quad #{[node.fval].pack('d').unpack('Q')[0]}")
      when Kind::BOOL
        emit(".byte #{IntEvaluator.eval(val).first > 0 ? 1 : 0}")
      when Kind::CHAR
        emit(".byte #{IntEvaluator.eval(val).first}")
      when Kind::SHORT
        emit(".short #{IntEvaluator.eval(val).first}")
      when Kind::INT
        emit(".long #{IntEvaluator.eval(val).first}")
      when Kind::LONG, Kind::LLONG, Kind::PTR
        if val.kind == OP::LABEL_ADDR
          emit(".quad #{val.newlabel}")
          return
        end

        is_char_ptr = val.operand && (val.operand.ty.kind == Kind::ARRAY && val.operand.ty.ptr.kind == Kind::CHAR)
        if is_char_ptr
          emit_data_charptr(val.operand.sval, depth)
        elsif val.kind == AST::GVAR
          emit(".quad #{val.glabel}")
        else
          v, base = IntEvaluator.eval(val)
          if !base
            emit(".quad %u", v)
            return
          end
          ty = base.ty
          if (base.kind == AST::CONV) || (base.kind == AST::ADDR)
            base = base.operand
          end
          if base.kind != AST::GVAR
            raise "global variable expected, but got #{base}"
          end
          Util.assert!{ !ty.ptr.nil? }
          emit(".quad #{base.glabel}+#{v * ty.ptr.size}")
        end
      else
        raise "don't know how to handle\n  <#{ty}>\n  <#{val}>"
      end
    end

    # @param [Node] operand
    # @param [Integer] depth
    def emit_data_addr(operand, depth)
      case operand.kind
      when AST::LVAR
        label = @label_gen.next
        emit(".data %d", depth + 1)
        emit_label(label)
        do_emit_data(operand.lvarinit, operand.ty.size, 0, depth + 1)
        emit(".data #{depth}")
        emit(".quad #{label}")
        return
      when AST::GVAR
        emit(".quad #{operand.glabel}")
        return
      else
        raise "internal error"
        # error("internal error");
      end
    end

    # @param [String] s
    # @param [Integer] depth
    def emit_data_charptr(s, depth)
      label = @label_gen.next
      emit(".data #{depth + 1}")
      emit_label(label)
      emit(".string \"#{Util.quote_cstring(s)}\"")
      emit(".data #{depth}")
      emit(".quad #{label}")
    end

    # @param [Node] v
    def emit_bss(v)
      # TODO(south37) impl SAVE when necessary
      # SAVE
      emit(".data")
      if !v.declvar.ty.isstatic
        emit(".global #{v.declvar.glabel}")
      end
      emit(".lcomm #{v.declvar.glabel}, #{v.declvar.ty.size}")
    end

    # @param [Node] node
    def emit_conv(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE
      emit_expr(node.operand)
      emit_load_convert(node.ty, node.operand.ty)
    end

    # @param [Type] to
    # @param [Type] from
    def emit_load_convert(to, from)
      # TODO(south37) impl SAVE when necessary
      # SAVE
      if Type.is_inttype(from) && to.kind == Kind::FLOAT
        emit("cvtsi2ss #eax, #xmm0")
      elsif Type.is_inttype(from) && to.kind == Kind::DOUBLE
        emit("cvtsi2sd #eax, #xmm0")
      elsif from.kind == Kind::FLOAT && to.kind == Kind::DOUBLE
        emit("cvtps2pd #xmm0, #xmm0")
      elsif (from.kind == Kind::DOUBLE || from.kind == Kind::LDOUBLE) && (to.kind == Kind::FLOAT)
        emit("cvtpd2ps #xmm0, #xmm0")
      elsif to.kind == Kind::BOOL
        emit_to_bool(from)
      elsif Type.is_inttype(from) && Type.is_inttype(to)
        emit_intcast(from)
      elsif Type.is_inttype(to)
        emit_toint(from)
      end
    end

    # @param [Type] ty
    def emit_intcast(ty)
      case ty.kind
      when Kind::BOOL, Kind::CHAR
        ty.usig ? emit("movzbq #al, #rax") : emit("movsbq #al, #rax")
      when Kind::SHORT
        ty.usig ? emit("movzwq #ax, #rax") : emit("movswq #ax, #rax")
      when Kind::INT
        # cf. https://web.stanford.edu/class/cs107/guide/x86-64.html
        ty.usig ? emit("mov #eax, #eax") : emit("cltq");
      when Kind::LONG, Kind::LLONG
        # Do nothing
      end
    end

    # @param [Type] ty
    def emit_to_bool(ty)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      if Type.is_flotype(ty)
        push_xmm(1)
        emit("xorpd #xmm1, #xmm1")
        emit("%s #xmm1, #xmm0", (ty.kind == Kind::FLOAT) ? "ucomiss" : "ucomisd")
        emit("setne #al")
        pop_xmm(1)
      else
        emit("cmp $0, #rax")
        emit("setne #al")
      end
      emit("movzb #al, #eax")
    end

    # @param [Type] ty
    def emit_toint(ty)
      # TODO(south37) impl SAVE when necessary
      # SAVE
      if ty.kind == Kind::FLOAT
        emit("cvttss2si #xmm0, #eax")
      elsif ty.kind == Kind::DOUBLE
        emit("cvttsd2si #xmm0, #eax")
      end
    end

    # @param [Node] node
    def emit_return(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE
      if node.retval
        emit_expr(node.retval)
        maybe_booleanize_retval(node.retval.ty)
      end
      emit_ret
    end

    # @param [Type] ty
    def maybe_booleanize_retval(ty)
      if ty.kind == Kind::BOOL
        emit("movzx #al, #rax")
      end
    end

    def emit_ret
      # TODO(south37) impl SAVE when necessary
      # SAVE
      emit("leave")
      emit("ret")
    end

    # @param [Node] node
    def emit_compound_stmt(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE
      node.stmts.each do |stmt|
        emit_expr(stmt)
      end
    end

    # @param [Node] node
    def emit_computed_goto(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      emit_expr(node.operand)
      emit("jmp *#rax")
    end

    # @param [Node]
    def emit_binop(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE
      if node.ty.kind == Kind::PTR
        emit_pointer_arith(node.kind, node.left, node.right)
        return
      end

      case node.kind
      when '<'    then emit_comp("setl", "setb", node); return
      when OP::EQ then emit_comp("sete", "sete", node); return
      when OP::LE then emit_comp("setle", "setna", node); return
      when OP::NE then emit_comp("setne", "setne", node); return
      end

      if Type.is_inttype(node.ty)
        emit_binop_int_arith(node)
      elsif Type.is_flotype(node.ty)
        emit_binop_float_arith(node)
      else
        raise "internal error: #{node}"
      end
    end

    # @param [AST] kind
    # @param [Node] left
    # @param [Node] right
    def emit_pointer_arith(kind, left, right)
      # TODO(south37) impl SAVE when necessary
      # SAVE
      emit_expr(left)
      push("rcx")
      push("rax")
      emit_expr(right)
      size = left.ty.ptr.size
      if size > 1
        emit("imul $#{size}, #rax")
      end
      emit("mov #rax, #rcx")
      pop("rax")
      case kind
      when '+' then emit("add #rcx, #rax")
      when '-' then emit("sub #rcx, #rax")
      else
        raise "invalid operator '#{kind}'"
        # error("invalid operator '%d'", kind)
      end
      pop("rcx")
    end

    # @param [Node] node
    def emit_binop_int_arith(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE
      case node.kind
      when '+'     then op = "add"
      when '-'     then op = "sub"
      when '*'     then op = "imul"
      when '^'     then op = "xor"
      when OP::SAL then op = "sal"
      when OP::SAR then op = "sar"
      when OP::SHR then op = "shr"
      when '/', '%'
        # Do nothing
      else
        raise "invalid operator '#{node.kind}'"
      end

      emit_expr(node.left)
      push("rax")
      emit_expr(node.right)
      emit("mov #rax, #rcx")
      pop("rax")

      if (node.kind == '/') || (node.kind == '%')
        if node.ty.usig
          emit("xor #edx, #edx");
          emit("div #rcx");
        else
          emit("cqto");
          emit("idiv #rcx")
        end
        if node.kind == '%'
          emit("mov #edx, #eax")
        end
      elsif (node.kind == OP::SAL) || (node.kind == OP::SAR) || (node.kind == OP::SHR)
        emit("#{op} #cl, ##{get_int_reg(node.left.ty, 'a')}")
      else
        emit("#{op} #rcx, #rax")
      end
    end

    # @param [Node] node
    def emit_binop_float_arith(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE
      isdouble = node.ty.kind == Kind::DOUBLE
      case node.kind
      when '+' then op = (isdouble ? "addsd" : "addss")
      when '-' then op = (isdouble ? "subsd" : "subss")
      when '*' then op = (isdouble ? "mulsd" : "mulss")
      when '/' then op = (isdouble ? "divsd" : "divss")
      else
        raise "invalid operator '#{node.kind}'"
      end

      emit_expr(node.left)
      push_xmm(0)
      emit_expr(node.right)
      emit("#{(isdouble ? "movsd" : "movss")} #xmm0, #xmm1")
      pop_xmm(0);
      emit("#{op} #xmm1, #xmm0")
    end

    # @param [Node] node
    def emit_decl(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      return if (!node.declinit)
      emit_decl_init(node.declinit, node.declvar.loff, node.declvar.ty.size)
    end

    # @param [Array] inits
    # @param [Integer] off
    # @param [Integer] totalsize
    def emit_decl_init(inits, off, totalsize)
      emit_fill_holes(inits, off, totalsize)
      inits.each do |node|
        Util.assert!{ node.kind == AST::INIT }
        isbitfield = (node.totype.bitsize && node.totype.bitsize > 0)
        if node.initval.kind == AST::LITERAL && !isbitfield
          emit_save_literal(node.initval, node.totype, node.initoff + off)
        else
          emit_expr(node.initval)
          emit_lsave(node.totype, node.initoff + off)
        end
      end
    end

    # @param [Array] inits
    # @param [Integer] off
    # @param [Integer] totalsize
    def emit_fill_holes(inits, off, totalsize)
      # If at least one of the fields in a variable are initialized,
      # unspecified fields has to be initialized with 0.
      lastend = 0
      inits.sort_by(&:initoff).each do |node|
        if lastend < node.initoff
          emit_zero_filler(lastend + off, node.initoff + off)
        end
        lastend = node.initoff + node.totype.size
      end
      emit_zero_filler(lastend + off, totalsize + off)
    end

    # @param [Integer] s
    # @param [Integer] e
    def emit_zero_filler(s, e)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      while s <= (e- 4) do
        emit("movl $0, #{s}(#rbp)")
        s += 4
      end
      while s < e
        emit("movb $0, #{s}(#rbp)")
        s += 1
      end
    end

    # @param [Node] node
    # @param [Type] totype
    # @param [Integer] off
    def emit_save_literal(node, totype, off)
      case totype.kind
      when Kind::BOOL  then emit("movb $#{node.ival}, #{off}(#rbp)")
      when Kind::CHAR  then emit("movb $#{node.ival}, #{off}(#rbp)")
      when Kind::SHORT then emit("movw $#{node.ival}, #{off}(#rbp)")
      when Kind::INT   then emit("movl $#{node.ival}, #{off}(#rbp)")
      when Kind::LONG, Kind::LLONG, Kind::PTR
        emit("movl $#{node.ival & ((1 << 32) - 1)}, #{off    }(#rbp)")
        emit("movl $#{node.ival >> 32            }, #{off + 4}(#rbp)")
      when Kind::FLOAT
        val = [node.fval].pack('f').unpack('I')[0]
        emit("movl $#{val}, #{off}(#rbp)")
      when Kind::DOUBLE, Kind::LDOUBLE
        val = [node.fval].pack('d').unpack('Q')[0]
        emit("movl $#{val & ((1 << 32) - 1)}, #{off    }(#rbp)")
        emit("movl $#{val >> 32            }, #{off + 4}(#rbp)")
      else
        raise "internal error: <#{node}> <#{totype}> <#{off}>"
      end
    end

    # @param [Type] ty
    # @param [Integer] off
    def emit_lsave(ty, off)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      if ty.kind == Kind::FLOAT
        emit("movss #xmm0, #{off}(#rbp)")
      elsif ty.kind == Kind::DOUBLE
        emit("movsd #xmm0, #{off}(#rbp)")
      else
        maybe_convert_bool(ty)
        addr = "#{off}(%rbp)"
        maybe_emit_bitshift_save(ty, addr)
        reg = get_int_reg(ty, 'a')
        emit("mov ##{reg}, %s", addr)
      end
    end

    # @param [String] varname
    # @param [Type] ty
    # @param [Integer] off
    def emit_gsave(varname, ty, off)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      Util.assert!{ ty.kind != Kind::ARRAY }
      maybe_convert_bool(ty)
      reg = get_int_reg(ty, 'a')
      addr = "#{varname}+#{off}(%rip)"
      maybe_emit_bitshift_save(ty, addr)
      emit("mov ##{reg}, %s", addr)
    end

    # @param [Type] ty
    def maybe_convert_bool(ty)
      if ty.kind == Kind::BOOL
        emit("test #rax, #rax")
        emit("setne #al")
      end
    end

    # @param [Type] ty
    # @param [Char] r
    # @return [Integer]
    def get_int_reg(ty, r)
      Util.assert!{ r == 'a' || r == 'c' }
      case ty.size
      when 1 then return (r == 'a') ? "al" : "cl"
      when 2 then return (r == 'a') ? "ax" : "cx"
      when 4 then return (r == 'a') ? "eax" : "ecx"
      when 8 then return (r == 'a') ? "rax" : "rcx"
      else
        raise "Unknown data size: #{ty}: #{ty.size}"
      end
    end

    # @param [Type] ty
    # @param [String] addr
    def maybe_emit_bitshift_save(ty, addr)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      return if ty.bitsize.nil? || ty.bitsize < 0
      push("rcx")
      push("rdi")
      v = (1 << ty.bitsize) - 1
      emit("mov $#{sprintf("%#x", v)}, #rdi")
      emit("and #rdi, #rax")
      emit("shl $#{ty.bitoff}, #rax")
      emit("mov %s, ##{get_int_reg(ty, 'c')}", addr)
      # TODO(south37): Consider bit size. Use 32 bit temporary here
      v = 0xffffffff - (((1 << ty.bitsize) - 1) << ty.bitoff)
      #v = ~(((1 << ty.bitsize) - 1) << ty.bitoff)
      emit("mov $#{sprintf("%#x", v)}, #rdi")
      emit("and #rdi, #rcx")
      emit("or #rcx, #rax")
      pop("rdi")
      pop("rcx")
    end

    # @param [Node] node
    def emit_assign(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      if (node.left.ty.kind == Kind::STRUCT) && (node.left.ty.size > 8)
        emit_copy_struct(node.left, node.right)
      else
        emit_expr(node.right)
        emit_load_convert(node.ty, node.right.ty)
        emit_store(node.left)
      end
    end

    # @param [Node] node
    def emit_label_addr(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      emit("mov $%s, #rax", node.newlabel)
    end

    # @param [Node] left
    # @param [Node] right
    def emit_copy_struct(left, right)
      push("rcx")
      push("r11")
      emit_addr(right)
      emit("mov #rax, #rcx")
      emit_addr(left)
      i = 0
      while (i < left.ty.size) do
        emit("movq #{i}(#rcx), #r11")
        emit("movq #r11, #{i}(#rax)")
        i += 8
      end
      while (i < left.ty.size) do
        emit("movl #{i}(#rcx), #r11")
        emit("movl #r11, #{i}(#rax)")
        i += 4
      end
      while (i < left.ty.size) do
        emit("movb #{i}(#rcx), #r11")
        emit("movb #r11, #{i}(#rax)")
        i += 1
      end
      pop("r11")
      pop("rcx")
    end

    # @param [Node] node
    def emit_addr(node)
      case node.kind
      when AST::LVAR
        ensure_lvar_init(node)
        emit("lea #{node.loff}(#rbp), #rax")
      when AST::GVAR
        emit("lea #{node.glabel}(#rip), #rax")
      when AST::DEREF
        emit_expr(node.operand)
      when AST::STRUCT_REF
        emit_addr(node.struct)
        emit("add $#{node.ty.offset}, #rax")
      when AST::FUNCDESG
        emit("lea #{node.fname}(#rip), #rax")
      else
        raise "internal error: #{node}"
      end
    end

    # @param [Node] var
    def emit_store(var)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      case var.kind
      when AST::DEREF
        emit_assign_deref(var)
      when AST::STRUCT_REF
        emit_assign_struct_ref(var.struct, var.ty, 0)
      when AST::LVAR
        ensure_lvar_init(var)
        emit_lsave(var.ty, var.loff)
      when AST::GVAR
        emit_gsave(var.glabel, var.ty, 0)
      else
        raise "internal error"
      end
    end

    # @param [Node] var
    def emit_assign_deref(var)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      push("rax")
      emit_expr(var.operand)
      do_emit_assign_deref(var.operand.ty.ptr, 0)
    end

    # @param [Type] ty
    # @param [Integer] off
    def do_emit_assign_deref(ty, off)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      emit("mov (#rsp), #rcx")
      reg = get_int_reg(ty, 'c')
      if off > 0
        emit("mov ##{reg}, #{off}(#rax)")
      else
        emit("mov ##{reg}, (#rax)")
      end
      pop("rax")
    end

    # @param [Node] struct
    # @param [Type] field
    # @param [Integer] off
    def emit_assign_struct_ref(struct, field, off)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      case struct.kind
      when AST::LVAR
        ensure_lvar_init(struct)
        emit_lsave(field, struct.loff + field.offset + off)
      when AST::GVAR
        emit_gsave(struct.glabel, field, field.offset + off)
      when AST::STRUCT_REF
        emit_assign_struct_ref(struct.struct, field, off + struct.ty.offset)
      when AST::DEREF
        push("rax")
        emit_expr(struct.operand)
        do_emit_assign_deref(field, field.offset + off)
      else
        raise "internal error: #{struct}"
        # error("internal error: %s", node2s(struct));
      end
    end

    # @param [Node] node
    def ensure_lvar_init(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      Util.assert!{ node.kind == AST::LVAR }
      if node.lvarinit
        emit_decl_init(node.lvarinit, node.loff, node.ty.size)
      end
      node.lvarinit = nil
    end

    # @param [Node] node
    def emit_deref(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      emit_expr(node.operand)
      emit_lload(node.operand.ty.ptr, "rax", 0)
      emit_load_convert(node.ty, node.operand.ty.ptr)
    end

    # @param [Type] ty
    # @param [String] base
    # @param [Integer] off
    def emit_lload(ty, base, off)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      if ty.kind == Kind::ARRAY
        emit("lea #{off}(##{base}), #rax")
      elsif ty.kind == Kind::FLOAT
        emit("movss #{off}(##{base}), #xmm0")
      elsif (ty.kind == Kind::DOUBLE) || (ty.kind == Kind::LDOUBLE)
        emit("movsd %d(#%s), #xmm0", off, base)
      else
        inst = get_load_inst(ty)
        emit("#{inst} #{off}(##{base}), #rax")
        maybe_emit_bitshift_load(ty)
      end
    end

    # @param [Type] ty
    def get_load_inst(ty)
      case ty.size
      when 1 then return "movsbq"
      when 2 then return "movswq"
      when 4 then return "movslq"
      when 8 then return "mov"
      else
        raise "Unknown data size: #{ty}: #{ty.size}"
      end
    end

    # @param [Type] ty
    def maybe_emit_bitshift_load(ty)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      return if ty.bitsize.nil? || ty.bitsize <= 0
      emit("shr $#{ty.bitoff}, #rax")
      push("rcx")
      emit("mov $#{sprintf("%#x", (1 << ty.bitsize) - 1)}, #rcx")
      emit("and #rcx, #rax")
      pop("rcx")
    end

    # @param [Node] node
    def emit_ternary(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      emit_expr(node.cond)
      ne = @label_gen.next
      emit_je(ne)
      if node.thn
        emit_expr(node.thn)
      end
      if node.els
        e = @label_gen.next
        emit_jmp(e)
        emit_label(ne)
        emit_expr(node.els)
        emit_label(e)
      else
        emit_label(ne)
      end
    end

    # @param [String] label
    def emit_je(label)
      emit("test #rax, #rax")
      emit("je #{label}")
    end

    # @param [String] label
    def emit_jmp(label)
      emit("jmp #{label}")
    end

    # @param [Node] node
    def emit_goto(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      Util.assert!{ node.newlabel }
      emit_jmp(node.newlabel)
    end

    # @param [Node] node
    # @return [Boolean]
    def maybe_emit_builtin(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      if "__builtin_return_address" == node.fname
        emit_builtin_return_address(node)
        return true
      end
      if "__builtin_reg_class" == node.fname
        emit_builtin_reg_class(node)
        return true
      end
      if "__builtin_va_start" == node.fname
        emit_builtin_va_start(node)
        return true
      end
      false
    end

    # @param [Node] node
    def emit_builtin_return_address(node)
      push("r11");
      Util.assert!{ node.args.size == 1 }
      emit_expr(node.args[0])
      l = @label_gen.next
      e = @label_gen.next
      emit("mov #rbp, #r11")
      emit_label(l)
      emit("test #rax, #rax")
      emit("jz %s", e)
      emit("mov (#r11), #r11")
      emit("sub $1, #rax")
      emit_jmp(l)
      emit_label(e)
      emit("mov 8(#r11), #rax")
      pop("r11")
    end

    # Set the register class for parameter passing to RAX.
    # 0 is INTEGER, 1 is SSE, 2 is MEMORY.
    #
    # @param [Node] node
    def emit_builtin_reg_class(node)
      arg = node.args[0]
      Util.assert!{ arg.ty.kind == Kind::PTR }
      ty = arg.ty.ptr
      if ty.kind == Kind::STRUCT
        emit("mov $2, #eax")
      elsif Type.is_flotype(ty)
        emit("mov $1, #eax")
      else
        emit("mov $0, #eax")
      end
    end

    # @param [Node] node
    def emit_builtin_va_start(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      Util.assert!{ node.args.size == 1 }
      emit_expr(node.args[0])
      push("rcx")
      emit("movl $%d, (#rax)", @numgp * 8)
      emit("movl $%d, 4(#rax)", 48 + @numfp * 16)
      emit("lea %d(#rbp), #rcx", -REGAREA_SIZE)
      emit("mov #rcx, 16(#rax)")
      pop("rcx")
    end

    # @param [Node] node
    def emit_func_call(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      opos = @stackpos
      isptr = (node.kind == AST::FUNCPTR_CALL)
      ftype = isptr ? node.fptr.ty.ptr : node.ftype

      ints = []
      floats = []
      rest = []
      classify_args(ints, floats, rest, node.args)
      save_arg_regs(ints.size, floats.size)

      padding = @stackpos % 16
      if (padding > 0)
        emit("sub $8, #rsp")
        @stackpos += 8
      end

      restsize = emit_args(rest.reverse)
      if isptr
        emit_expr(node.fptr)
        push("rax")
      end
      emit_args(ints)
      emit_args(floats)
      pop_float_args(floats.size)
      pop_int_args(ints.size)

      if isptr
        pop("r11")
      end
      if ftype.hasva
        emit("mov $#{floats.size}, #eax")
      end

      if isptr
        emit("call *#r11")
      else
        fname = "#{node.fname}@PLT"
        emit("call #{fname}")
      end
      maybe_booleanize_retval(node.ty)
      if restsize > 0
        emit("add $#{restsize}, #rsp")
        @stackpos -= restsize
      end
      if padding > 0
        emit("add $8, #rsp")
        @stackpos -= 8
      end
      restore_arg_regs(ints.size, floats.size)
      Util.assert!{ opos == @stackpos }
    end

    # @param(return) [Array] ints
    # @param(return) [Array] floats
    # @param(return) [Array] rest
    # @param [Array] args
    def classify_args(ints, floats, rest, args)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      ireg = 0
      xreg = 0
      imax = 6
      xmax = 8
      args.each do |v|
        if v.ty.kind == Kind::STRUCT
          rest.push(v)
        elsif Type.is_flotype(v.ty)
          if xreg < xmax
            floats.push(v)
          else
            rest.push(v)
          end
          xreg += 1
        else
          if ireg < imax
            ints.push(v)
          else
            rest.push(v)
          end
          ireg += 1
        end
      end
    end

    # @param [Integer] nints
    # @param [Integer] nfloats
    def save_arg_regs(nints, nfloats)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      Util.assert!{ nints <= 6 }
      Util.assert!{ nfloats <= 8 }
      0.upto(nints - 1) do |i|
        push(REGS[i])
      end
      1.upto(nfloats - 1) do |i|
        push_xmm(i)
      end
    end

    # @param [Integer] nints
    # @param [Integer] nfloats
    def restore_arg_regs(nints, nfloats)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      (nfloats - 1).downto(1) do |i|
        pop_xmm(i);
      end
      (nints - 1).downto(0) do |i|
        pop(REGS[i])
      end
    end

    # @param [Array] vals
    # @return [Integer]
    def emit_args(vals)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      r = 0
      vals.each do |v|
        if v.ty.kind == Kind::STRUCT
          emit_addr(v);
          r += push_struct(v.ty.size)
        elsif Type.is_flotype(v.ty)
          emit_expr(v)
          push_xmm(0)
          r += 8
        else
          emit_expr(v)
          push("rax")
          r += 8
        end
      end
      r
    end

    # @param [Integer] nints
    def pop_int_args(nints)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      (nints - 1).downto(0) do |i|
        pop(REGS[i]);
      end
    end

    # @param [Integer] nfloats
    def pop_float_args(nfloats)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      (nfloats - 1).downto(0) do |i|
        pop_xmm(i)
      end
    end

    # @param [String] inst
    # @param [String] usiginst
    # @param [Node] node
    def emit_comp(inst, usiginst, node)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      if Type.is_flotype(node.left.ty)
        emit_expr(node.left)
        push_xmm(0)
        emit_expr(node.right)
        pop_xmm(1)
        if node.left.ty.kind == Kind::FLOAT
          emit("ucomiss #xmm0, #xmm1")
        else
          emit("ucomisd #xmm0, #xmm1")
        end
      else
        emit_expr(node.left)
        push("rax")
        emit_expr(node.right)
        pop("rcx")
        kind = node.left.ty.kind
        if (kind == Kind::LONG) || (kind == Kind::LLONG)
          emit("cmp #rax, #rcx")
        else
          emit("cmp #eax, #ecx")
        end
      end
      if Type.is_flotype(node.left.ty) || node.left.ty.usig
        emit("#{usiginst} #al")
      else
        emit("#{inst} #al")
      end
      emit("movzb #al, #eax")
    end

    # @param [Node] node
    # @param [String] op
    def emit_pre_inc_dec(node, op)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      emit_expr(node.operand)
      emit("#{op} $#{node.ty.ptr ? node.ty.ptr.size : 1}, #rax")
      emit_store(node.operand)
    end

    # @param [Node] node
    # @param [String] op
    def emit_post_inc_dec(node, op)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      emit_expr(node.operand)
      push("rax")
      emit("#{op} $#{node.ty.ptr ? node.ty.ptr.size : 1}, #rax")
      emit_store(node.operand)
      pop("rax")
    end

    # @param [Node] node
    def emit_lognot(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      emit_expr(node.operand)
      emit("cmp $0, #rax")
      emit("sete #al")
      emit("movzb #al, #eax")
    end

    # @param [Node] node
    def emit_logand(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      e = @label_gen.next
      emit_expr(node.left)
      emit("test #rax, #rax")
      emit("mov $0, #rax")
      emit("je #{e}")
      emit_expr(node.right)
      emit("test #rax, #rax")
      emit("mov $0, #rax")
      emit("je #{e}")
      emit("mov $1, #rax")
      emit_label(e)
    end

    # @param [Node] node
    def emit_logor(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      e = @label_gen.next
      emit_expr(node.left)
      emit("test #rax, #rax")
      emit("mov $1, #rax")
      emit("jne #{e}")
      emit_expr(node.right)
      emit("test #rax, #rax")
      emit("mov $1, #rax")
      emit("jne #{e}")
      emit("mov $0, #rax")
      emit_label(e)
    end

    # @param [Node] node
    def emit_cast(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      emit_expr(node.operand)
      emit_load_convert(node.ty, node.operand.ty)
    end

    # @param [Node]
    def emit_bitand(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      emit_expr(node.left)
      push("rax")
      emit_expr(node.right)
      pop("rcx")
      emit("and #rcx, #rax")
    end

    # @param [Node]
    def emit_bitor(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      emit_expr(node.left)
      push("rax")
      emit_expr(node.right)
      pop("rcx")
      emit("or #rcx, #rax")
    end

    # @param [Node] node
    def emit_bitnot(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      emit_expr(node.operand)
      emit("not #rax")
    end

    # @param [Node] struct
    # @param [Type] field
    # @param [Integer] off
    def emit_load_struct_ref(struct, field, off)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      case struct.kind
      when AST::LVAR
        ensure_lvar_init(struct)
        emit_lload(field, "rbp", struct.loff + field.offset + off)
      when AST::GVAR
        emit_gload(field, struct.glabel, field.offset + off)
      when AST::STRUCT_REF
        emit_load_struct_ref(struct.struct, field, struct.ty.offset + off)
      when AST::DEREF
        emit_expr(struct.operand)
        emit_lload(field, "rax", field.offset + off)
      else
        raise "internal error: #{struct}"
      end
    end

    # @param [Node] node
    def emit_comma(node)
      # TODO(south37) impl SAVE when necessary
      # SAVE;
      emit_expr(node.left)
      emit_expr(node.right)
    end
  end
end
