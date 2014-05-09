require 'rspec'
require 'scoring_array'
describe ScoringArray do
  before(:each) do
    ScoringArray.operations_count = 0
  end

  it "gets and sets" do
    array = ScoringArray.new(10)
    ScoringArray.operations_count.should == 1
    array.set(4,10)
    ScoringArray.operations_count.should == 2
    array.get(4).should == 10
    ScoringArray.operations_count.should == 3
  end

  it "does not let you set past the end" do
    array = ScoringArray.new(10)
    expect{array.set(9999,10)}.to raise_error
  end

  it "knows when it looks like another array" do
    array = ScoringArray.new(2)
    array.set(0,0)
    array.set(1,1)
    expect(array).to eq([0,1])
    expect(array).not_to eq([1,0])
  end

  it "slices" do
    bigger_one = ScoringArray.from_array([0, 1, 2, 3, 4,  5])
    littler_one = bigger_one.slice(2,3)
    expect(littler_one.equals_array?([2,3])).to be_true
  end
end
