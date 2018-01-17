require "rucc/node/conv"
require "rucc/utf"

module Rucc
  module AST
    LITERAL       = "AST::LITERAL"
    LVAR          = "AST::LVAR"
    GVAR          = "AST::GVAR"
    TYPEDEF       = "AST::TYPEDEF"
    FUNCALL       = "AST::FUNCALL"
    FUNCPTR_CALL  = "AST::FUNCPTR_CALL"
    FUNCDESG      = "AST::FUNCDESG"
    FUNC          = "AST::FUNC"
    DECL          = "AST::DECL"
    INIT          = "AST::INIT"
    CONV          = "AST::CONV"
    ADDR          = "AST::ADDR"
    DEREF         = "AST::DEREF"
    IF            = "AST::IF"
    TERNARY       = "AST::TERNARY"
    DEFAULT       = "AST::DEFAULT"
    RETURN        = "AST::RETURN"
    COMPOUND_STMT = "AST::COMPOUND_STMT"
    STRUCT_REF    = "AST::STRUCT_REF"
    GOTO          = "AST::GOTO"
    COMPUTED_GOTO = "AST::COMPUTED_GOTO"
    LABEL         = "AST::LABEL"
  end

  # AST node
  class Node
    extend Conv

    # @param [AST] kind
    # @param [Type] ty
    def initialize(kind,
                   ty: nil,
                   ival: nil,                               # Integer
                   fval: nil, flabel: nil,                  # Float or double
                   varname: nil,                            # Local/global variable
                   loff: nil, lvarinit: nil,                # Local variable
                   glabel: nil,                             # Global variable
                   left: nil, right: nil,                   # Binary operator
                   operand: nil,                            # Unary operator
                   fname: nil,                              # Function call or function declaration
                   args: nil, ftype: nil,                   # Function call
                   fptr: nil,                               # Function pointer or function designator
                   params: nil, localvars: nil, body: nil,  # Function declaration
                   sval: nil, slabel: nil,                  # String
                   declvar: nil, declinit: nil,             # Declaration
                   initval: nil, initoff: nil, totype: nil, # Initializer
                   cond: nil, thn: nil, els: nil,           # If statement or ternary operator
                   label: nil, newlabel: nil,               # Goto and label
                   retval: nil,                             # Return statement
                   stmts: nil,                              # Compound statement
                   struct: nil, field: nil, fieldtype: nil  # Struct reference
                   )
      @kind = kind
      @ty = ty
      @ival = ival                                             # Integer
      @fval = fval; @flabel = flabel                           # Float or double
      @varname = varname                                       # Local/global variable
      @loff = loff; @lvarinit = lvarinit                       # Local variable
      @glabel = glabel                                         # Global variable
      @left = left; @right = right                             # Binary operator
      @operand = operand                                       # Unary operator
      @fname = fname                                           # Function call or function declaration
      @args = args; @ftype = ftype                             # Function call
      @fptr = fptr                                             # Function pointer or function designator
      @params = params; @localvars = localvars; @body = body   # Function declaration
      @sval = sval; @slabel = slabel                           # String
      @declvar = declvar; @declinit = declinit                 # Declaration
      @initval = initval; @initoff = initoff; @totype = totype # Initializer
      @cond = cond; @thn = thn; @els = els                     # If statement or ternary operator
      @label = label; @newlabel = newlabel                     # Goto and label
      @retval = retval                                         # Return statement
      @stmts = stmts                                           # Compound statement
      @struct = struct; @field = field; @fieldtype = fieldtype # Struct reference
    end
    attr_reader :kind, :ty,
                :ival,                       # Integer
                :fval, :flabel,              # Float or double
                :varname,                    # Local/global variable
                :loff, :lvarinit,            # Local variable
                :glabel,                     # Global variable
                :left, :right,               # Binary operator
                :operand,                    # Unary operator
                :sval, :slabel,              # String
                :fname,                      # Function
                :args, :ftype,               # Function call
                :fptr,                       # Function pointer or function designator
                :params, :localvars, :body,  # Function Declaration
                :declvar, :declinit,         # Declaration
                :initval, :initoff, :totype, # Initializer
                :cond, :thn, :els,           # If statement or ternary operator
                :label, :newlabel,           # Goto and label
                :retval,                     # Return statement
                :stmts,                      # Compound statement
                :struct, :field, :fieldtype  # Struct reference
    attr_writer :ty, :flabel, :loff, :lvarinit, :slabel, :newlabel

    # @return [String]
    def to_s
      case kind
      when AST::LITERAL
        case ty.kind
        when Kind::CHAR
          if    ival == "\n" then return "'\\n'"      # '\n'
          elsif ival == "\\" then return "'\\\\'"     # '\\'
          elsif ival == "\0" then return "'\\0'"      # '\0'
          else                    return "'#{ival.chr}'"  # cf. 'a'
          end
        when Kind::INT
          return ival.to_s
        when Kind::FLOAT, Kind::DOUBLE, Kind::LDOUBLE
          return fval.to_s
        when Kind::LONG, Kind::LLONG
          return "#{ival}L"
        when Kind::ARRAY  # Consider string literal
          return "\"#{Util.quote_cstring(sval)}\""
        else
          raise "internal error"
        end
      when AST::LABEL
        return "#{label}:"
      when AST::LVAR
        s = "lv=#{varname}"
        if lvarinit
          s << "(#{lvarinit})"
        end
        return s
      when  AST::GVAR
        return "gv=#{varname}"
      when AST::FUNCALL, AST::FUNCPTR_CALL
        return "(#{ty})#{kind == AST::FUNCALL ? fname : Node.node_or_nil_to_s(node)}(#{args.map { |arg| Node.node_or_nil_to_s(arg) }.join(",")})"
      when AST::FUNCDESG
        return "(funcdesg #{fname})"
      when AST::FUNC
        return "(#{ty})#{fname}(#{params.map { |param| "#{param.ty} #{Node.node_or_nil_to_s(param)}" }.join(",")})#{Node.node_or_nil_to_s(body)}"
      when AST::GOTO
        return "goto(#{label})"
      when AST::DECL
        s = "(decl #{declvar.ty} #{declvar.varname}"
        if declinit
          s << " #{declinit.join(" ")}"
        end
        s << ")"
        return s
      when AST::INIT
        return "#{initval}@#{initoff}"
      when AST::CONV
        return "(conv #{operand}=>#{ty})"
      when AST::IF
        s = "(if #{Node.node_or_nil_to_s(cond)} #{Node.node_or_nil_to_s(thn)}"
        if els
          s << " #{els}"
        end
        s << ")"
        return s
      when AST::TERNARY
        return "(? #{Node.node_or_nil_to_s(cond)} #{Node.node_or_nil_to_s(thn)} #{Node.node_or_nil_to_s(els)})"
      when AST::RETURN
        return "(return #{retval})"
      when AST::COMPOUND_STMT
        return "{#{stmts.map { |stmt| "#{stmt};" }.join}}"
      when AST::STRUCT_REF
        return "#{struct}.#{field}"
      when AST::ADDR            then return "(addr #{operand})"
      when AST::DEREF           then return "(deref #{operand})"
      when OP::SAL              then return "(<< #{left} #{right})"
      when OP::SAR, OP::SHR     then return "(>> #{left} #{right})"
      when OP::GE               then return "(>= #{left} #{right})"
      when OP::LE               then return "(<= #{left} #{right})"
      when OP::NE               then return "(!= #{left} #{right})"
      when OP::PRE_INC          then return "(pre++ #{operand})"
      when OP::PRE_DEC          then return "(pre-- #{operand})"
      when OP::POST_INC         then return "(post++ #{operand})"
      when OP::POST_DEC         then return "(post-- #{operand})"
      when OP::LOGAND           then return "(and #{left} #{right})"
      when OP::LOGOR            then return "(or #{left} #{right})"
      when '!'                  then return "(! #{operand})"
      when '&'                  then return "(& #{left} #{right})"
      when '|'                  then return "(| #{left} #{right})"
      when OP::CAST
        return "((#{operand.ty})=>(#{ty}) #{operand})"
      when OP::LABEL_ADDR
        return "&&#{label}"
      when OP::EQ
        return "(== #{left} #{right})"
      else
        return "(#{kind} #{left} #{right})"
      end

      raise "Must not reach here!"
    end

    class << self
      # @param [Node, NilClass] node
      def node_or_nil_to_s(node)
        return '(nil)' if node.nil?
        node.to_s
      end

      # @param [Type] ty
      # @param [Integer] val
      def ast_inttype(ty, val)
        Util.assert!{ val.is_a?(Integer) }
        Node.new(AST::LITERAL, ty: ty, ival: val)
      end

      # @param [Type] ty
      # @param [Double] val
      # @return [Node]
      def ast_floattype(ty, val)
        Node.new(AST::LITERAL,
                 ty: ty,
                 fval: val)
      end

      # @param [ENC] enc
      def ast_string(enc, str)
        case enc
        when ENC::NONE, ENC::UTF8
          ty = Type.make_array_type(Type::CHAR, str.bytes.size + 1)
          body = str
        when ENC::CHAR16
          b = UTF.to_utf16(str)
          ty = Type.make_array_type(Type::USHORT, (b.bytes.size / Type::USHORT.size) + 1)
          body = b + "\0"  # NOTE: Add only \0 (\0\0 - \0)
        when ENC::CHAR32, ENC::WCHAR
          b = UTF.to_utf32(str)
          ty = Type.make_array_type(Type::UINT, (b.bytes.size / Type::UINT.size) + 1)
          body = b + "\0\0\0"  # NOTE: Add only \0\0\0 (\0\0\0\0 - \0)
        else
          raise "Invalid encoding"
        end
        Node.new(AST::LITERAL,
                 ty:   ty,
                 sval: body)
      end

      # @param [Type] ty
      # @param [String] fname
      # @param [Array] params
      # @param [Node] body
      # @param [Array] localvars
      # @return [Node]
      def ast_func(ty, fname, params, body, localvars)
        Node.new(AST::FUNC,
                 ty:        ty,
                 fname:     fname,
                 params:    params,
                 localvars: localvars,
                 body:      body)
      end

      # @param [Node] fptr
      # @param [<Node>] args
      # @return [Node]
      def ast_funcptr_call(fptr, args)
        Util.assert!{ fptr.ty.kind == Kind::PTR }
        Util.assert!{ fptr.ty.ptr.kind == Kind::FUNC }
        Node.new(AST::FUNCPTR_CALL,
                 ty:   fptr.ty.ptr.rettype,
                 fptr: fptr,
                 args: args)
      end

      # @param [Type] ty
      # @param [String] fname
      def ast_funcdesg(ty, fname)
        Node.new(AST::FUNCDESG,
                 ty: ty,
                 fname: fname)
      end

      # @param [Type] ftype
      # @param [String] fname
      # @param [Array] args
      # @return [Node]
      def ast_funcall(ftype, fname, args)
        Node.new(AST::FUNCALL,
                 ty:    ftype.rettype,
                 fname: fname,
                 args:  args,
                 ftype: ftype)
      end

      # @param [String] kind
      # @param [Type] ty
      # @param [Node] operand
      def ast_uop(kind, ty, operand)
        Node.new(kind,
                 ty:      ty,
                 operand: operand)
      end

      # @param [Type] ty
      # @param [String] kind
      # @param [Node] left
      # @param [Node] right
      # @return [Node]
      def ast_binop(ty, kind, left, right)
        Node.new(kind,
                 ty:    ty,
                 left:  left,
                 right: right)
      end

      # @param [String] op
      # @param [Node] lhs
      # @param [Node] rhs
      # @return [Node]
      def binop(op, lhs, rhs)
        if (lhs.ty.kind == Kind::PTR) && (rhs.ty.kind == Kind::PTR)
          if !valid_pointer_binop?(op)
            raise "internal pointer arith"
          end
          # C11 6.5.6.9: Pointer subtractions have type ptrdiff_t.
          if (op == '-'.freeze)
            return Node.ast_binop(Type::LONG, op, lhs, rhs)
          end
          # C11 6.5.8.6, 6.5.9.3: Pointer comparisons have type int.
          return Node.ast_binop(Type::INT, op, lhs, rhs);
        end

        # NOTE: Set pointer node as left
        if lhs.ty.kind == Kind::PTR
          return Node.ast_binop(lhs.ty, op, lhs, rhs)
        end
        if rhs.ty.kind == Kind::PTR
          return Node.ast_binop(rhs.ty, op, rhs, lhs)
        end

        Util.assert!{ Type.is_arithtype(lhs.ty) }
        Util.assert!{ Type.is_arithtype(rhs.ty) }
        r = Type.usual_arith_conv(lhs.ty, rhs.ty)
        Node.ast_binop(r, op, wrap(r, lhs), wrap(r, rhs))
      end

      # @param [OP] op
      # @return [Boolean]
      def valid_pointer_binop?(op)
        case op
        when '-', '<', '>', OP::EQ, OP::NE, OP::GE, OP::LE
          return true
        else
          return false
        end
      end

      # @param [Type] t
      # @param [Node] node
      # @return [Node]
      def wrap(t, node)
        if Type.same_arith_type(t, node.ty)
          return node
        end
        Node.ast_uop(AST::CONV, t, node)
      end

      # @param [Node] cond
      # @param [Node] thn
      # @param [Node] els
      # @return [Node]
      def ast_if(cond, thn, els)
        Node.new(AST::IF,
                 cond: cond,
                 thn: thn,
                 els: els)
      end

      # @param [Type] ty
      # @param [Node] cond
      # @param [Node] thn
      # @param [Node] els
      # @return [Node]
      def ast_ternary(ty, cond, thn, els)
        Node.new(AST::TERNARY,
                 ty:   ty,
                 cond: cond,
                 thn:  thn,
                 els:  els)
      end

      # @param [String] label
      # @return [Node]
      def ast_label(label)
        Node.new(AST::LABEL, label: label)
      end

      # @param [String] label
      # @return [Node]
      def ast_dest(label)
        Node.new(AST::LABEL,
                 label: label,
                 newlabel: label)
      end

      # @param [String] label
      def ast_label_addr(label)
        Node.new(OP::LABEL_ADDR,
                 ty:    Type.make_ptr_type(Type::VOID),
                 label: label)
      end

      # @param [String] label
      # @return [Node]
      def ast_jump(label)
        Node.new(AST::GOTO,
                 label: label,
                 newlabel: label)
      end

      # @param [String] label
      # @return [Node]
      def ast_goto(label)
        Node.new(AST::GOTO,
                 label: label)
      end

      # @param [Node] expr
      # @return [Node]
      def ast_computed_goto(expr)
        Node.new(AST::COMPUTED_GOTO,
                 operand: expr)
      end

      # @param [Node, NilClass] retval
      def ast_return(retval)
        Node.new(AST::RETURN,
                 retval: retval)
      end

      # @param [Type] totype
      # @param [Node] val
      # @return [Node]
      def ast_conv(totype, val)
        Node.new(AST::CONV,
                 ty:      totype,
                 operand: val)
      end

      # @param [Node] var
      # @param [Array] init
      def ast_decl(var, init)
        Node.new(AST::DECL,
                 declvar:  var,
                 declinit: init)
      end

      # @param [Node] val
      # @param [Type] totype
      # @param [Integer] off
      # @return [Node]
      def ast_init(val, totype, off)
        Node.new(AST::INIT,
                 initval: val,
                 initoff: off,
                 totype:  totype)
      end

      # @param [Array] stmts
      # @return [Node]
      def ast_compound_stmt(stmts)
        Node.new(AST::COMPOUND_STMT, stmts: stmts)
      end

      # @param [Type] ty
      # @param [String] name
      # @return [Node]
      def ast_typedef(ty, name, env)
        r = Node.new(AST::TYPEDEF, ty: ty)
        env[name] = r
        r
      end

      # @param [Type] ty
      # @param [Node] struct
      # @param [String] name
      # @return [Node]
      def ast_struct_ref(ty, struct, name)
        Node.new(AST::STRUCT_REF,
                 ty:     ty,
                 struct: struct,
                 field:  name)
      end

      # @param [Type] ty
      # @param [String] name
      # @param [RMap] localenv
      # @param [Array] localvars
      # @return [Node]
      def ast_lvar(ty, name, localenv, localvars)
        r = Node.new(AST::LVAR, ty: ty, varname: name)
        if localenv
          localenv[name] = r
        end
        if localvars
          localvars.push(r)
        end
        r
      end

      # @param [Type] ty
      # @param [String] name
      # @param [RMap] globalenv
      def ast_gvar(ty, name, globalenv)
        r = Node.new(AST::GVAR, ty: ty, varname: name, glabel: name)
        globalenv[name] = r
        r
      end

      # @param [Type] ty
      # @param [String] name
      # @param [RMap] localenv
      # @param [String] glabel
      # @return [String]
      def ast_static_lvar(ty, name, localenv, glabel)
        r = Node.new(AST::GVAR,
                     ty: ty,
                     varname: name,
                     glabel: glabel)
        Util.assert!{ localenv }
        localenv[name] = r
        r
      end
    end
  end
end
