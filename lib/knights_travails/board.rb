# frozen_string_literal: true

# namespace for the project.
module KnightsTravails
  # representation of the chessboard.
  class ChessBoard
    attr_accessor :board

    def initialize
      # store pieces in board locations.
      # board[file][rank]
      # Array rows are board columns (file)
      # Array columns are board rows (rank)
      @board = Array.new(8) { Array.new(8) }
    end

    def occupied?(pos)
      return false unless board[pos.file][pos.rank]

      true
    end

    def on_board?(position)
      return false if position.rank.negative?
      return false if position.rank >= board.length
      return false if position.file.negative?
      return false if position.file >= board.length

      true
    end

    def collect_pieces
      # return an array containing all chess pieces.
      result = []
      board.each do |file|
        file.each do |square|
          result << square if square
        end
      end
    end

    def load_pieces(chess_pieces)
      # restore pieces to the board.
      clear_board
      chess_pieces.each do |piece|
        board[piece.location.rank][piece.location.file] = piece
      end
    end

    def file(pos)
      board[pos.file]
    end

    def rank(pos)
      board.map { |file| file[pos.rank] }
    end

    def rdiagonal(position)
      arr = []
      rank, file = position.pos
      x = [file, rank].min

      file -= x
      rank -= x
      while continue_right?(rank, file)
        arr << board[file][rank]
        file += 1
        rank += 1
      end
      arr
    end

    def ldiagonal(position)
      arr = diagonal(dir: :left)
      rank, file = position.pos

      x = [(arr.length - 1), file].min

      file -= x
      rank += x

      while continue_left?(rank, file)
        arr << board[file][rank]
        file += 1
        rank -= 1
      end
      arr
    end

    def to_s
      msg = []
      board.each do |file|
        file.each do |square|
          msg << square.to_s
        end
      end
      msg.join("\n")
    end

    private

    def clear_board
      self.board = Array.new(8) { Array.new(8) }
    end

    def continue_left?(rank, file)
      return false if file > 7
      return false if rank.negative?

      true
    end

    def continue_right?(rank, file)
      return false if file > 7
      return false if rank > 7

      true
    end
  end
end
