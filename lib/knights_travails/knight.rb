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
      @positioncodes = PositionCoding.new
    end

    def next_states
      results = []
      movement.each do |move|
        new_position = calculate_new_position(move, position)
        next unless new_position.valid?

        results << Knight.new(team: team,
                              position: new_position,
                              board: board)
      end
      results
    end

    private

    attr_accessor :movement, :positioncodes

    def calculate_new_position(move, position)
      cur_file, cur_rank = position.to_a
      new_pos = []
      new_pos << (cur_file + (move[1] * direction))
      new_pos << (cur_rank + move[0])
      Position.new(board_pos: positioncodes.encoder[new_pos])
    end
  end
end
