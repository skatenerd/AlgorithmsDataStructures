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
      merged.should == [1, 4, 5, 10]
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
      current_length = 2
      nth_try = 0
      last_ratio = nil
      convergence_threshold = 0.01
      while true
        n_logn = current_length * Math.log(current_length, 2)
        to_sort = random_array(current_length)

        ScoringArray.clear_counts
        MergeSort.sort(to_sort)

        ratio = ScoringArray.operations_count / n_logn

        puts "Ratio was: #{ratio}"
        if last_ratio && ((last_ratio - ratio).abs < convergence_threshold)
          puts "YAY you converged to some mutliple of n-log-n"
          puts "your constant was: #{ratio}"
          break
        end

        last_ratio = ratio
        current_length += 10000
        nth_try += 1

        if nth_try > 15
          raise "You never converged to n log n! try again!"
        end
      end
    end
  end
end
