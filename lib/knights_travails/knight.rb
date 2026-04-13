# frozen_string_literal: true

# chess knight.
module KnightsTravails
  # chesspiece: knight.
  class Knight < ChessPiece
    def initialize(team: 0, position: nil, board: nil)
      super
      @description = 'K'
      @movement = [
        [1, 2], [1, -2],
        [-1, 2], [-1, -2],
        [2, 1], [2, -1],
        [-2, 1], [-2, -1]
      ]
    end

    def next_states
      results = []
      movement.each do |move|
        new_position = calculate_new_position(move, position)
        if board.on_board?(new_position)
          results << Knight.new(position: new_position,
                                board: board)
        end
      end
      results
    end

    private

    attr_accessor :movement

    def calculate_new_position(move, position)
      cur_rank, cur_file = position.pos
      new_rank = cur_rank + move[0]
      new_file = cur_file + (move[1] * direction)

      Position.new(rank: new_rank, file: new_file)
    end
  end
end
