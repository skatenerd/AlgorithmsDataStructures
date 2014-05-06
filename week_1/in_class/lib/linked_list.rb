class LinkedList
  class Node
    attr_accessor :value, :next_node

    def initialize(value, next_node = nil)
      @value = value
      @next_node = next_node
    end
  end

  attr_accessor :head

  def append(value)
  end

  def get(index)
  end

  def prepend(value)
  end

  def insert_before(index, value)
  end
end
