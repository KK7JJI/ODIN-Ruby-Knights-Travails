# frozen_string_literal: true

require_relative '../lib/knights_travails'

describe KnightsTravails::ChessPiece do
  subject(:cp) { KnightsTravails::ChessPiece.new(team: 0) }
  let(:ocpw) { KnightsTravails::ChessPiece.new(team: 0) }
  let(:ocpb) { KnightsTravails::ChessPiece.new(team: 1) }
  let(:loc) { [0, 0] }
  let(:nilpiece) { nil }
  let(:pos1) { KnightsTravails::Position.new(board_pos: 'a1') }
  let(:pos2) { KnightsTravails::Position.new(board_pos: 'h8') }

  it 'chess piece compared to nil' do
    expect(cp == nilpiece).to eql(false)
  end
  it 'chess piece compared to array' do
    expect(cp == loc).to eql(false)
  end

  it 'chess piece compared to opposing team' do
    cp.position = pos1
    cp.description = 'P'
    ocpb.position = pos1
    ocpb.description = 'P'
    expect(cp == ocpb).to eql(false)
  end

  it 'chess piece differing descriptions' do
    cp.position = pos1
    cp.description = 'P'
    ocpw.position = pos1
    ocpw.description = 'Q'
    expect(cp == ocpw).to eql(false)
  end
  it 'chess piece differing positions' do
    cp.position = pos1
    cp.description = 'P'
    ocpw.position = pos2
    ocpw.description = 'P'
    expect(cp == ocpw).to eql(false)
  end
  it 'chess pieces equal' do
    cp.position = pos1
    cp.description = 'P'
    ocpw.position = pos1
    ocpw.description = 'P'
    expect(cp == ocpw).to eql(true)
  end
end
