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
    if self.head
      current = self.head
      while(current.next_node)
        current = current.next_node
      end
      current.next_node = LinkedList::Node.new(value)
    else
      self.head = LinkedList::Node.new(value)
    end
  end

  def get(index)
    current = self.head
    while(index > 0)
      current = current.next_node
      index -= 1
    end
    return current.value
  end

  def prepend(value)
    if head.nil?
      self.head = LinkedList::Node.new(value)
    else
      self.head = LinkedList::Node.new(value, self.head)
    end
  end

  def insert_before(index, value)
    current = self.head
    if index == 0
      self.head = LinkedList::Node.new(value, self.head)
      return
    end
    while(index > 1)
      unless current
        raise "Out Of Bounds"
      end
      current = current.next_node
      index -= 1
    end
    new_node = LinkedList::Node.new(value, current.next_node)
    current.next_node = new_node
  end
end
