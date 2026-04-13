# frozen_string_literal: true

# project namespace
module KnightsTravails
  FILE = (0...8).to_a.map { |item| ('a'.ord + item).chr }

  # describes a row, col location
  class Position
    attr_accessor :rank, :file

    def initialize(file: 0, rank: 0)
      @file = file
      @rank = rank
    end

    def pos
      [rank, file]
    end

    def to_h
      key = "#{FILE[file]}#{rank + 1}"
      { key => { file: file, rank: rank } }
    end

    def ==(other)
      return false unless other
      return false unless other.is_a?(Position)
      return false unless file == other.file
      return false unless rank == other.rank

      true
    end

    def to_s
      "#{FILE[file]}#{rank + 1} => rank: #{rank + 1}, file: #{file + 1}"
    end
  end
end
