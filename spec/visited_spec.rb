# frozen_string_literal: true

require_relative '../lib/knights_travails'

describe KnightsTravails::Visited do
  subject(:vst) { KnightsTravails::Visited.new }
  let(:node) { KnightsTravails::Node.new(parent: nil, state: nil) }

  it '#visited? returns false if node not in visited container.' do
    expect(vst.visited?(node)).to eql(false)
  end

  it '#visited returns true if node is in visited container.' do
    vst.visit(node)
    expect(vst.visited?(node)).to eql(true)
  end
end
