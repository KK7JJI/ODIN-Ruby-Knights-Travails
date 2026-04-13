# frozen_string_literal: true

module KnightsTravails
  class BFS
    attr_accessor :visited

    def initialize(start: nil, goal: nil)
      @start = start
      @goal = goal
      @queue = Queue.new
      @visited = Visited.new
    end

    def bfs(start, goal)
      queue.push(start)

      until queue.empty?
        node = queue.pop while !queue.empty? || visited.visited?(node)
        visited.visit(node)
        return node if node == goal

        node.state.next_states.each do |next_state|
          next_node = Node.new(parent: node, state: next_state)
          queue.push(next_node)
        end
      end

      nil
    end
  end
end
