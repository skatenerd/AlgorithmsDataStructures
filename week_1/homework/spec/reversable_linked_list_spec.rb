require 'rspec'
require 'reversable_linked_list'

describe ReversableLinkedList do
  it "reverses a list" do
    linked_list = ReversableLinkedList.new
    linked_list.append(:a)
    linked_list.append(:b)
    linked_list.append(:c)
    linked_list.reverse
    linked_list.get(0).should == :c
    linked_list.get(1).should == :b
    linked_list.get(2).should == :a
  end
end
