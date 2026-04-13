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
        puts 'new position'
        puts node.state
        puts ''
        visited.visit(node)
        return node if node == goal

        puts 'next positions'
        node.state.next_states.each do |next_state|
          next_node = Node.new(parent: node, state: next_state)
          puts next_state unless visited.visited?(next_node)
          queue.push(value: next_node) unless visited.visited?(next_node)
        end
        puts ''
      end

      nil
    end
  end
end
