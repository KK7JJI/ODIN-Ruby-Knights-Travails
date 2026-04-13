# frozen_string_literal: true

module KnightsTravails
  class BFS
    attr_accessor :visited, :queue, :start, :goal

    def initialize(start: nil, goal: nil)
      @start = start
      @goal = goal
      @queue = Queue.new
      @visited = Visited.new
    end

    def execute
      node = Node.new(parent: nil, state: start)
      queue.push(value: node)

      until queue.empty?
        node = queue.pop
        puts node.state
        visited.visit(node)
        return node if node.state == goal

        node.state.next_states.each do |next_state|
          next_node = Node.new(parent: node, state: next_state)
          queue.push(value: next_node) unless visited.visited?(next_node)
        end
      end

      nil
    end
  end
end
