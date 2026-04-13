# frozen_string_literal: true

# namespace for the project.
module KnightsTravails
  # save state information for tree verticies.

  # breadth first search node
  class Node
    attr_accessor :state, :parent

    def initialize(state: nil,
                   parent: nil)
      @parent = parent
      @state = state
    end

    def ==(other)
      return false unless other
      return false unless other.is_a?(Node)
      return false unless state == other.state

      true
    end
  end
end
