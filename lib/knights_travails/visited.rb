# frozen_string_literal: true

module KnightsTravails
  # store nodes which have already been visited
  class Visited
    attr_accessor :container

    def initialize
      @container = []
    end

    def visit(node)
      container << node
    end

    def visited?(node)
      container.any?(node)
    end
  end
end
