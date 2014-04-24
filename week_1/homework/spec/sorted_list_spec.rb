require 'rspec'
require 'sorted_list'

describe SortedLinkedList do
  it "maintains sort order on add" do
    list = SortedLinkedList.new
    list.insert(10)
    list.insert(5)
    list.insert(0)
    list.insert(4)
    expect(list.get(0)).to eq 0
    expect(list.get(1)).to eq 4
    expect(list.get(2)).to eq 5
    expect(list.get(3)).to eq 10
  end
end
