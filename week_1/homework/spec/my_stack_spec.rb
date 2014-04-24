require 'rspec'
require 'my_stack'

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
