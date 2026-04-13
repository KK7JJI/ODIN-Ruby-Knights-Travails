# frozen_string_literal: true

# project namespace
module KnightsTravails
  # breadth first search algorithm
  class BFS
    attr_accessor :visited, :queue, :start, :goal

    def initialize(start: nil, goal: nil)
      @start = start
      @goal = goal
      @queue = Queue.new
      @visited = Visited.new
    end

    def execute
      init_queue

      until queue.empty?
        node = queue.pop
        visited.visit(node)
        return node if node.state == goal

        node.state.next_states.each do |next_state|
          push_next_node(parent: node, state: next_state)
        end
      end

      nil
    end

    def init_queue
      queue.push(value: Node.new(parent: nil, state: start))
    end

    def push_next_node(parent: nil, state: nil)
      next_node = Node.new(parent: parent, state: state)
      queue.push(value: next_node) unless visited.visited?(next_node)
    end
  end
end
