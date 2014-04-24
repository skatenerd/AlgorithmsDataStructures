require 'rspec'
require 'my_queue'

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
