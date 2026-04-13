# frozen_string_literal: true

require_relative '../lib/knights_travails'

describe KnightsTravails::Knight do
  subject(:knight) { KnightsTravails::Knight.new }
  let(:board) { KnightsTravails::ChessBoard.new }
  let(:pos1) { KnightsTravails::Position.new(rank: 0, file: 0) }
  let(:pos2) { KnightsTravails::Position.new(rank: 0, file: 7) }
  let(:pos3) { KnightsTravails::Position.new(rank: 7, file: 0) }
  let(:pos4) { KnightsTravails::Position.new(rank: 7, file: 7) }
  let(:pos5) { KnightsTravails::Position.new(rank: 4, file: 3) }

  describe '#next_states' do
    before do
      knight.board = board
    end

    context 'rank: horizonal row, file: vertical row on the chessboard.' do
      it 'a1, yields c2, b3' do
        knight.position = pos1
        values = %w[c2 b3]
        results = knight.next_states
        expect(results.length).to eql(2)
        results.each do |knight|
          key = knight.position.to_h.keys[0]
          expect(values.include?(key))
          values.delete(key)
        end
        expect(values).to be_empty
      end
      it 'h1, yields f2, g3' do
        knight.position = pos2
        values = %w[f2 g3]
        results = knight.next_states
        expect(results.length).to eql(2)
        results.each do |knight|
          key = knight.position.to_h.keys[0]
          expect(values.include?(key))
          values.delete(key)
        end
        expect(values).to be_empty
      end
      it 'a8, yields c7, b6' do
        knight.position = pos3
        values = %w[c7 b6]
        results = knight.next_states
        expect(results.length).to eql(2)
        results.each do |knight|
          key = knight.position.to_h.keys[0]
          expect(values.include?(key))
          values.delete(key)
        end
        expect(values).to be_empty
      end
      it 'h8, yields f7, g6' do
        knight.position = pos4
        values = %w[f7 g6]
        results = knight.next_states
        expect(results.length).to eql(2)
        results.each do |knight|
          key = knight.position.to_h.keys[0]
          expect(values.include?(key))
          values.delete(key)
        end
        expect(values).to be_empty
      end
      it 'd5, yields f6, b6, f4, b4, e7, c7, e3, c3' do
        knight.position = pos5
        values = %w[f6 b6 f4 b4 e7 c7 e3 c3]
        results = knight.next_states
        expect(results.length).to eql(8)
        results.each do |knight|
          key = knight.position.to_h.keys[0]
          expect(values.include?(key))
          values.delete(key)
        end
        expect(values).to be_empty
      end
    end
  end
end
