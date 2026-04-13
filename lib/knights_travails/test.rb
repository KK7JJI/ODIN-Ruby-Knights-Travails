# frozen_string_literal: true

require_relative 'position'
require_relative 'board'

def decoder
  decoder = {}
  (0...8).each do |file|
    notation = (0...8).map { |idx| ('a'.ord + file).chr + idx.to_s }
    (0...8).each do |rank|
      decoder[notation[rank]] = { file: file, rank: rank }
    end
  end
  decoder
end

puts decoder.inspect
