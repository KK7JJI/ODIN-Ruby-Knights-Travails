# frozen_string_literal: true

module KnightsTravails
  # store nodes which have already been visited
  class Visited
    attr_accessor :container

    def initialize
      @container = {}
    end

    def visit(node)
      container[node] = 'been here.'
    end

    def visited?(node)
      return true if container.key?(node)

      false
    end
  end
end
