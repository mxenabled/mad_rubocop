module RuboCop
  module Cop
    module Migrations
      class DefaultValue < Cop
        MSG = "Default values are not allowed".freeze

        def_node_search :default_value?, <<~PATTERN
          (pair (sym :default) (...))
        PATTERN

        def_node_search :add_column?, <<~PATTERN
          (send nil? :add_column ...)
        PATTERN

        def_node_search :column_definition?, <<~PATTERN
          (send (lvar :t) ...)
        PATTERN

        def on_send(node)
          return unless default_value?(node)

          add_offense(node) if column_definition?(node)
          add_offense(node) if add_column?(node)
        end
      end
    end
  end
end
