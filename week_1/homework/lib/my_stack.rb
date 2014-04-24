# Use a linked list to implement
# a Queue.

require_relative '../../in_class/lib/linked_list'

class MyStack
  def initialize
    self.linked_list = LinkedList.new
  end

  def push(element)
  end

  def pop
  end

  private
  attr_accessor :linked_list
end
