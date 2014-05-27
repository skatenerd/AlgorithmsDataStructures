require 'scoring_linked_list'

class DetermineComplexities
  def self.linked_list_prepends(n)
  end

  def self.linked_list_appends(n)
  end
end

describe DetermineComplexities do
  before(:each) do
    ScoringLinkedList.clear_counts
  end

  it "Knows complexity of N Linked List Prepends" do
    first_run_count = 1000
    first_list = ScoringLinkedList.new
    first_run_count.times do |i|
      first_list.prepend(i)
    end
    actual_operation_count = ScoringLinkedList.operations_count
    predicted_operation_count = DetermineComplexities.linked_list_prepends(first_run_count)
    first_ratio = (actual_operation_count + 0.0) / predicted_operation_count

    ScoringLinkedList.clear_counts

    second_run_count = 10000
    second_list = ScoringLinkedList.new
    second_run_count.times do |i|
      second_list.prepend(i)
    end
    actual_operation_count = ScoringLinkedList.operations_count
    predicted_operation_count = DetermineComplexities.linked_list_prepends(second_run_count)
    second_ratio = (actual_operation_count + 0.0) / predicted_operation_count

    first_ratio.should be_within(0.01).of(second_ratio)
  end

  it "knows the complexity of N Linked List Appends" do
    ###########################################
    # Append 50 elements.
    ###########################################
    first_run_count = 50
    first_list = ScoringLinkedList.new
    first_run_count.times do |i|
      first_list.append(i)
    end
    actual_operation_count = ScoringLinkedList.operations_count
    predicted_operation_count = DetermineComplexities.linked_list_appends(first_run_count)
    ###########################################################################
    # How many operations actually took place? How many do YOU think took place?
    ###########################################################################
    first_ratio = (actual_operation_count + 0.0) / predicted_operation_count

    ScoringLinkedList.clear_counts


    ###########################################
    # This time, append 1000 elements!
    ###########################################
    second_run_count = 1000
    second_list = ScoringLinkedList.new
    second_run_count.times do |i|
      second_list.append(i)
    end
    actual_operation_count = ScoringLinkedList.operations_count
    predicted_operation_count = DetermineComplexities.linked_list_appends(second_run_count)
    ###########################################################################
    # How many operations actually took place? How many do YOU think took place?
    ###########################################################################
    second_ratio = (actual_operation_count + 0.0) / predicted_operation_count


    ####################################################################################################
    # The ratios should not change.  Your guess can be wrong, but it should be wrong by the same amount!
    ####################################################################################################
    first_ratio.should be_within(0.01).of(second_ratio)
  end
end
