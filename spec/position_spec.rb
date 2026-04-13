# frozen_string_literal: true

require_relative '../lib/knights_travails'

describe KnightsTravails::Position do
  subject(:pos1) { KnightsTravails::Position.new }
  let(:pos2) { KnightsTravails::Position.new }
  let(:pos3) { nil }
  let(:pos4) { [0, 0] }

  describe '#== is based on rank and file within Position class.' do
    it 'pos1 and pos2 equal' do
      pos1.board_pos = 'a1'
      pos2.board_pos = 'a1'

      expect(pos1 == pos2).to eql(true)
    end
    it 'pos1 and pos2 rank differs' do
      pos1.board_pos = 'a1'
      pos1.board_pos = 'a2'

      expect(pos1 == pos2).to eql(false)
    end
    it 'pos1 and pos2 file differs' do
      pos1.board_pos = 'a1'
      pos1.board_pos = 'b1'

      expect(pos1 == pos2).to eql(false)
    end
    it 'pos1 == nil, false' do
      pos1.board_pos = 'a1'

      expect(pos1 == pos3).to eql(false)
    end
    it 'pos1 == Array, false' do
      pos1.board_pos = 'a1'

      expect(pos1 == pos4).to eql(false)
    end
  end

  describe '#to_h produces hash, key expressed in chess notation' do
    it 'a1 - h8 decodes to expected rand and file indices' do
      (0...8).each do |file|
        board_pos = (0...8).map { |idx| ('a'.ord + file).chr + (idx + 1).to_s }
        (0...8).each do |rank|
          pos1.board_pos = board_pos[rank]
          expect(pos1.file).to eql(file)
          expect(pos1.rank).to eql(rank)
        end
      end
    end
  end
end
