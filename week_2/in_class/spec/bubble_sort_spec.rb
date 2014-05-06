require 'bubble_sort'
require 'rspec'

describe BubbleSort do
  it "sorts a single entry" do
    bubble_sort = BubbleSort.new([0])
    bubble_sort.tick
    bubble_sort.list.should == [0]
  end

  it "sorts two elements on one tick" do
    bubble_sort = BubbleSort.new([1, 0])
    bubble_sort.tick
    bubble_sort.list.should == [0, 1]
  end

  it "sorts a three element array" do
    bubble_sort = BubbleSort.new([4, 3, 2, 1])
    bubble_sort.tick
    bubble_sort.list.should == [3, 4, 2, 1]
    bubble_sort.tick
    bubble_sort.list.should == [3, 2, 4, 1]
    bubble_sort.tick
    bubble_sort.list.should == [3, 2, 1, 4]
    bubble_sort.tick
    bubble_sort.list.should == [2, 3, 1, 4]
    bubble_sort.tick
    bubble_sort.list.should == [2, 1, 3, 4]
    bubble_sort.tick
    bubble_sort.list.should == [1, 2, 3, 4]
  end
end
