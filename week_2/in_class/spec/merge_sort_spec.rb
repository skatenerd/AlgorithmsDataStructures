require 'rspec'
require 'scoring_array'

class MergeSort
  def self.merge(left, right)
    ScoringArray.new(0)
  end
end
describe MergeSort do
  before(:each) do
    ScoringArray.operations_count = 0
  end

  describe "merge" do
    it "merges two arrays" do
      left = ScoringArray.from_array([1, 5])
      right = ScoringArray.from_array([4, 10])
      merged = MergeSort.merge(left, right)
      expect(merged.equals_array?([1, 4, 5, 10])).to be_true
    end
  end
end
