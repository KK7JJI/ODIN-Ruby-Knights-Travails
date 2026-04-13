# frozen_string_literal: true

module KnightsTravails
  # main program entry point.
  class App
    def run(args)
      start = assign_start_position(args[0])
      goal = assign_goal_position(args[1])

      bfs = BFS.new(start: start, goal: goal)
      solution = bfs.execute

      render_solution(solution) if solution
    end

    def assign_start_position(start)
      pos = KnightsTravails::Position.new(board_pos: start)
      if pos.valid?
        return KnightsTravails::Knight.new(team: 0,
                                           position: pos)
      end

      nil
    end

    def assign_goal_position(goal)
      pos = KnightsTravails::Position.new(board_pos: goal)
      if pos.valid?
        return KnightsTravails::Knight.new(team: 0,
                                           position: pos)
      end

      nil
    end

    def render_solution(solution)
      node = solution
      msg = []
      until node.parent.nil?
        msg << node.state
        node = node.parent
      end
      puts msg.reverse.join("\n")
    end
  end
end
