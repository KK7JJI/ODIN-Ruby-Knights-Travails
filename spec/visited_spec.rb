# frozen_string_literal: true

require_relative '../lib/knights_travails'

describe KnightsTravails::Visited do
  subject(:vst) { KnightsTravails::Visited.new }
  let(:state1) { KnightsTravails::Knight.new(team: 0, position: 'a1') }
  let(:state2) { KnightsTravails::Knight.new(team: 0, position: 'a2') }
  let(:node1) { KnightsTravails::Node.new(parent: nil, state: nil) }
  let(:node2) { KnightsTravails::Node.new(parent: nil, state: nil) }

  it '#visited? returns false if node not in visited container.' do
    expect(vst.visited?(node1)).to eql(false)
  end

  it '#visited returns true if node is in visited container.' do
    vst.visit(node1)
    expect(vst.visited?(node1)).to eql(true)
  end
  it '#visited returns true if node is in visited container.' do
    node1.state = state1
    node2.state = state1
    vst.visit(node1)
    expect(vst.visited?(node2)).to eql(true)
  end
end
