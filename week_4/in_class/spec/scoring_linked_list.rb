class ScoringLinkedList
  class Node
    attr_accessor :value

    def initialize(value, next_node = nil)
      ScoringLinkedList.operations_count += 1
      @value = value
      @next_node = next_node
    end

    def next_node
      ScoringLinkedList.operations_count += 1
      return @next_node
    end

    def next_node=(node)
      ScoringLinkedList.operations_count += 1
      @next_node = node
    end

    def value
      ScoringLinkedList.operations_count += 1
      return @value
    end

    def value=(value)
      @value = value
    end
  end

  @operations_count = 0

  class << self
    attr_accessor :operations_count
  end

  attr_accessor :head

  def self.clear_counts
    self.operations_count = 0
  end

  def append(value)
    if self.head
      current = self.head
      while(current.next_node)
        current = current.next_node
      end
      current.next_node = ScoringLinkedList::Node.new(value)
    else
      self.head = ScoringLinkedList::Node.new(value)
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
      self.head = ScoringLinkedList::Node.new(value)
    else
      self.head = ScoringLinkedList::Node.new(value, self.head)
    end
  end

  def insert_before(index, value)
    current = self.head
    if index == 0
      self.head = ScoringLinkedList::Node.new(value, self.head)
      return
    end
    while(index > 1)
      unless current
        raise "Out Of Bounds"
      end
      current = current.next_node
      index -= 1
    end
    new_node = ScoringLinkedList::Node.new(value, current.next_node)
    current.next_node = new_node
  end
end
