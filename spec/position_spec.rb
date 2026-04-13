# frozen_string_literal: true

require_relative '../lib/knights_travails'

describe KnightsTravails::Position do
  subject(:pos1) { KnightsTravails::Position.new }
  let(:pos2) { KnightsTravails::Position.new }

  describe '#== is based on rank and file within Position class.' do
    it 'pos1 and pos2 equal' do
      pos1.rank = 0
      pos1.file = 0
      pos2.rank = 0
      pos2.file = 0

      expect(pos1 == pos2).to eql(true)
    end
    it 'pos1 and pos2 rank differs' do
      pos1.rank = 0
      pos1.file = 0
      pos2.rank = 1
      pos2.file = 0

      expect(pos1 == pos2).to eql(false)
    end
    it 'pos1 and pos2 file differs' do
      pos1.rank = 0
      pos1.file = 0
      pos2.rank = 0
      pos2.file = 1

      expect(pos1 == pos2).to eql(false)
    end
    it 'pos1 == nil, false' do
      pos1.rank = 0
      pos1.file = 0
      expect(pos1.nil?).to eql(false)
    end
    it 'pos1 == Array, false' do
      pos1.rank = 0
      pos1.file = 0
      expect(pos1 == [0, 0]).to eql(false)
    end
  end

  describe '#to_h produces hash, key expressed in chess notation' do
    it 'a1 - h8' do
      (0...8).each do |file|
        pos1.file = file
        verify = (0...8).map { |idx| ('a'.ord + file).chr + idx.to_s }
        (0...8).each do |rank|
          pos1.rank = rank
          result = pos1.to_h
          expect(result.keys[0] == verify[rank])
        end
      end
    end
  end
end
