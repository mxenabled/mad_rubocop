module RuboCop
  module Cop
    module Migrations
      class ConcurrentIndex < Cop
        MSG = "Index must be added concurrently".freeze

        def_node_search :add_index?, <<~PATTERN
          (send nil? :add_index ...)
        PATTERN

        def_node_search :added_concurrently?, <<~PATTERN
          (pair (sym :algorithm) (sym :concurrently))
        PATTERN

        def_node_search :add_table_search, <<~PATTERN
          (send nil? :create_table ...)
        PATTERN

        def on_send(node)
          return unless add_index?(node)
          return if added_concurrently?(node)
          return if new_table?(node)

          add_offense(node)
        end

        # new_table? returns true when the table on which the index operation
        # is done is being added in the same migration method.
        def new_table?(node)
          new_tables = add_table_search(node.parent).map { |n| n.child_nodes.first.value }
          table_name = node.child_nodes.first.value
          new_tables.member?(table_name)
        end
      end
    end
  end
end
