module Rucc
  class Parser
    module Label

    private

      # @param [Token] tok
      # @return [Node]
      def read_label(tok)
        label = tok.sval
        if @labels[label]
          Util.errort!(tok, "duplicate label: #{tok}")
        end
        r = Node.ast_label(label)
        @labels[label] = r
        read_label_tail(r)
      end

      # @param [Node] label
      # @return [Node]
      def read_label_tail(label)
        stmt = read_stmt
        v = [label]
        if stmt
          v.push(stmt)
        end
        Node.ast_compound_stmt(v)
      end
    end
  end
end
