require_relative '../../../week_2/homework/lib/scoring_array'
require 'scoring_linked_list'
require 'binary_search'

class DetermineComplexities
  def self.linked_list_prepends(n)
  end

  def self.linked_list_appends(n)
  end

  def self.binary_search(n)
  end
end

describe DetermineComplexities do
  before(:each) do
    ScoringLinkedList.clear_counts
  end

  def append_to_linked_list(n_times)
    ScoringLinkedList.clear_counts
    list = ScoringLinkedList.new
    n_times.times do |i|
      list.append(i)
    end
    actual_operation_count = ScoringLinkedList.operations_count
    return actual_operation_count
  end

  def prepend_to_linked_list(n_times)
    ScoringLinkedList.clear_counts
    list = ScoringLinkedList.new
    n_times.times do |i|
      list.prepend(i)
    end
    actual_operation_count = ScoringLinkedList.operations_count
    return actual_operation_count
  end

  def binary_search_on_list(size)
    elements = ScoringArray.from_array((0...size).to_a)
    ScoringArray.clear_counts
    BinarySearch.contains?(elements, 0)
    return ScoringArray.operations_count
  end

  it "Knows complexity of N Linked List Prepends" do
    first_run_count = 1000
    actual_operation_count = prepend_to_linked_list(first_run_count)
    predicted_operation_count = DetermineComplexities.linked_list_prepends(first_run_count)
    first_ratio = (actual_operation_count + 0.0) / predicted_operation_count


    second_run_count = 10000
    actual_operation_count = prepend_to_linked_list(second_run_count)
    predicted_operation_count = DetermineComplexities.linked_list_prepends(second_run_count)
    second_ratio = (actual_operation_count + 0.0) / predicted_operation_count

    ####################################################################################################
    # The ratios should not change.  Your guess can be wrong, but it should be wrong by the same amount!
    ####################################################################################################
    first_ratio.should be_within(0.01).of(second_ratio)
  end

  it "knows the complexity of N Linked List Appends" do
    first_run_count = 50
    actual_operation_count = append_to_linked_list(first_run_count)
    predicted_operation_count = DetermineComplexities.linked_list_appends(first_run_count)
    first_ratio = (actual_operation_count + 0.0) / predicted_operation_count

    second_run_count = 1000
    actual_operation_count = append_to_linked_list(second_run_count)
    predicted_operation_count = DetermineComplexities.linked_list_appends(second_run_count)
    second_ratio = (actual_operation_count + 0.0) / predicted_operation_count

    first_ratio.should be_within(0.01).of(second_ratio)
  end

  it "knows complexity of binary search" do
    first_run_count = 100000
    actual_operation_count = binary_search_on_list(first_run_count)
    predicted_operation_count = DetermineComplexities.binary_search(first_run_count)
    first_ratio = (actual_operation_count + 0.0) / predicted_operation_count

    second_run_count = 200000
    actual_operation_count = binary_search_on_list(second_run_count)
    predicted_operation_count = DetermineComplexities.binary_search(second_run_count)
    second_ratio = (actual_operation_count + 0.0) / predicted_operation_count

    first_ratio.should be_within(0.01).of(second_ratio)
  end
end
