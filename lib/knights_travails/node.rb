# frozen_string_literal: true

# namespace for the project.
module KnightsTravails
  # save state information for tree verticies.
  class Node
    def initialize(state: nil,
                   parent: nil)
      @parent = parent
      @state = state
    end
  end
end
