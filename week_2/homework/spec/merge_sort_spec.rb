require 'rspec'
require 'merge_sort'
require 'scoring_array'

describe MergeSort do
  before(:each) do
    ScoringArray.operations_count = 0
  end

  describe "merge" do
    xit "merges two arrays" do
      left = ScoringArray.from_array([1, 5])
      right = ScoringArray.from_array([4, 10])
      merged = MergeSort.merge(left, right)
      expect(merged.equals_array?([1, 4, 5, 10])).to be_true
    end
  end

  describe "sort" do
    xit "sorts an array" do
      to_sort = ScoringArray.from_array([7,2,5,4,9,1,6,74,0])
      sorted = [0, 1, 2, 4, 5, 6, 7, 9, 74]
      MergeSort.sort(to_sort).should == sorted
    end
  end

  def random_array(length)
    ScoringArray.from_array((0...length).to_a.shuffle)
  end

  describe "convergence" do
    xit "time / (n*log(n)) converges" do
      max_length = 10000000
      current_length = 2
      while current_length < max_length
        n_logn = current_length * Math.log(current_length, 2)
        to_sort = random_array(current_length)

        ScoringArray.clear_counts
        MergeSort.sort(to_sort)

        ratio = ScoringArray.operations_count / n_logn

        puts "Ratio was: #{ratio}"
        current_length += 10000
      end
    end
  end
end
