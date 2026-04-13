# frozen_string_literal: true

require_relative '../lib/knights_travails'

describe KnightsTravails::Node do
  let(:node1) { KnightsTravails::Node.new(parent: nil) }
  let(:node2) { KnightsTravails::Node.new(parent: nil) }

  let(:pos1) { KnightsTravails::Position.new(board_pos: 'a1') }
  let(:pos2) { KnightsTravails::Position.new(board_pos: 'a8') }
  let(:state1) { KnightsTravails::Knight.new(team: 0, position: pos1) }
  let(:state2) { KnightsTravails::Knight.new(team: 0, position: pos1) }
  let(:state3) { KnightsTravails::Knight.new(team: 1, position: pos1) }
  let(:state4) { KnightsTravails::Knight.new(team: 1, position: pos2) }
  let(:state5) { KnightsTravails::Knight.new(team: 0, position: pos2) }
  let(:nil_state) { nil }
  let(:arr) { [0, 0] }

  describe 'node equality based on state' do
    it 'different nodes with same state are equal' do
      node1.state = state1
      node2.state = state2
      expect(node1 == node2).to eql(true)
    end
    it 'different nodes with states differing on team are not equal' do
      node1.state = state1
      node2.state = state3
      expect(node1 == node2).to eql(false)
    end
    it 'different nodes with states differing on position are not equal' do
      node1.state = state1
      node2.state = state5
      expect(node1 == node2).to eql(false)
    end
    it 'comparison of node to nil == false' do
      node1.state = state1
      expect(node1 == nil_state).to eql(false)
    end
    it 'comparison of node to other class == false' do
      node1.state = state1
      expect(node1 == arr).to eql(false)
    end
  end
end
