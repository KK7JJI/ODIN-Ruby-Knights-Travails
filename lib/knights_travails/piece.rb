# frozen_string_literal: true

# namespace for the project
module KnightsTravails
  TEAM = {
    0 => { color: 'White', direction: 1 },
    1 => { color: 'Black', direction: -1 }
  }.freeze

  # a generic chess piece, abstract class.
  class ChessPiece
    attr_accessor :description, :position, :board, :team

    def initialize(team: 0, position: nil, board: nil)
      @description = 'U'
      @team = team
      @color = TEAM[@team][:color]
      @direction = TEAM[@team][:direction]
      @board = board
      @position = position
    end

    def next_states
      raise NotImplementedError, '#next_states must be defined in subclass.'
    end

    def to_s
      "#{description}: Location = #{position}"
    end

    def ==(other)
      return false unless other
      return false unless other.is_a?(ChessPiece)
      return false unless team == other.team
      return false unless description == other.description
      return false unless position == other.position

      true
    end

    private

    attr_accessor :direction
  end
end
