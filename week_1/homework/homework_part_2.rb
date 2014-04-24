# Use linked list to implement both
# Queue and Stack.



class MyQueue
  def initialize
    @linked_list = LinkedList.new
  end

  def push(element)
  end

  def pop
  end

  private
  attr_reader :linked_list
end

class MyStack
  def initialize
    @linked_list = LinkedList.new
  end

  def push(element)
  end

  def pop
  end

  private
  attr_reader :linked_list
end

require 'rspec'

describe MyQueue do
  it "push-pops" do
    queue = MyQueue.new
    queue.push(1)
    queue.push(2)
    queue.push(3)
    expect(queue.pop).to eq 1
    expect(queue.pop).to eq 2
    expect(queue.pop).to eq 3
    expect(queue.pop).to be_nil
  end
end

describe MyStack do
  it "push-pops" do
    stack = MyStack.new
    stack.push(1)
    stack.push(2)
    stack.push(3)
    expect(stack.pop).to eq 3
    expect(stack.pop).to eq 2
    expect(stack.pop).to eq 1
    expect(stack.pop).to be_nil
  end
end
