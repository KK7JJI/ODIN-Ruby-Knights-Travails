# frozen_string_literal: true

# namespace for the project.
module KnightsTravails
  # describes nodes on the search tree.
  class Queue
    attr_accessor :length

    def initialize(size: 1000)
      @container = Array(size)
      @head = 0
      @tail = 0
      @size = size
      @length = 0
    end

    def push(value: nil)
      container[tail] = value
      self.tail += 1
      self.tail = self.tail % size
      self.length += 1
      raise "overflow error, queue size #{size} was exceeded." if head == tail
    end

    def pop
      return nil if head == tail

      result = container[head]
      self.head += 1
      self.head = self.head % size
      self.length -= 1
      result
    end

    def empty?
      return true if head == tail

      false
    end

    private

    attr_accessor :size, :head, :tail, :container
  end
end
