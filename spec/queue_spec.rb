# frozen_string_literal: true

require_relative '../lib/knights_travails'

describe KnightsTravails::Queue do
  subject(:cue) { KnightsTravails::Queue.new(size: 10) }

  it '#empty on new queue' do
    expect(cue).to be_empty
  end

  it '#empty, not empty on initial push to queue.' do
    cue.push(value: 0)
    expect(cue).not_to be_empty
    expect(cue.length).to eql(1)
  end

  it '#push, queue will accept values up to its size (10 - 1 = 9).' do
    (0...9).to_a.each do |idx|
      expect { cue.push(value: idx).to increase { cue.length }.by(1) }
    end
  end
  it '#pop, queue returns values first in first out.' do
    (0...9).to_a.each do |idx|
      cue.push(value: idx)
    end

    (0...9).to_a.each do |idx|
      val = 0
      expect { val = cue.pop }.to change { cue.length }.by(-1)
      expect(val).to eql(idx)
    end
    expect(cue.length).to eql(0)
    expect(cue).to be_empty
  end

  context 'Queue pointers wrap when space allows in its internal array.' do
    it '#push, raise error on push, queue is full.' do
      (0...9).to_a.each do |idx|
        cue.push(value: idx)
      end
      expect { cue.push(value: 9) }.to raise_error(RuntimeError)
    end
    it '#push, pop makes room for an additional value at queues end' do
      (0...9).to_a.each do |idx|
        cue.push(value: idx)
      end
      expect(cue.pop).to eql(0)
      cue.push(value: 9)
      expect { cue.push(value: 10) }.to raise_error(RuntimeError)
    end
    it '#pop, continues to return values in order after wrap arround.' do
      (0...9).to_a.each do |idx|
        cue.push(value: idx)
      end
      (0...9).to_a.each do |idx|
        cue.pop
      end
      # head and tail are each at idx 8
      # the queue has an internal array idx 0 -> 9
      expect(cue.length).to eql(0)
      expect(cue).to be_empty

      (0...9).to_a.each do |idx|
        cue.push(value: idx)
      end
      (0...9).to_a.each do |idx|
        expect(cue.pop).to eql(idx)
      end
    end
  end
end
