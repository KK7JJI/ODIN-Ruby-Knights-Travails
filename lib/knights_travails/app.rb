# frozen_string_literal: true

module KnightsTravails
  # main program entry point.
  class App
    def run(args)
      start = assign_start_position(args[0])
      goal = assign_goal_position(args[1])

      # bfs = BFS.new(start: start, goal: goal)
      # solution = bfs.execute
      # puts solution.inspect
    end

    def assign_start_position(start)
      pos = KnightsTravails::Position.new(board_pos: start)
      return KnightsTravails::Knight.new(position: pos) if pos.valid?

      nil
    end

    def assign_goal_position(goal)
      pos = KnightsTravails::Position.new(board_pos: goal)
      return KnightsTravails::Knight.new(position: pos) if pos.valid?

      nil
    end
  end
end
