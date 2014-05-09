class ScoringArray
  @operations_count = 0
  @allocations_count = 0

  class << self
    attr_accessor :operations_count, :allocations_count
  end

  def initialize(length)
    self.class.operations_count += 1
    self.class.allocations_count += length
    self.length = length
    self.underlying_array = []
  end

  def self.clear_counts
    self.operations_count = 0
    self.allocations_count = 0
  end

  def self.from_array(initializer)
    instance = ScoringArray.new(initializer.length)
    initializer.each_with_index do |element, index|
      instance.set(index, element)
    end
    instance
  end

  def set(index, value)
    self.class.operations_count += 1
    if index > @length
      raise "Index out of bounds"
    end
    underlying_array[index] = value
  end

  def get(index)
    self.class.operations_count += 1
    underlying_array[index]
  end

  def length
    self.class.operations_count += 1
    return @length
  end

  def slice(start_index, end_index)
    array_slice = underlying_array.slice(start_index..end_index)
    self.class.from_array(array_slice)
  end

  def ==(other)
    underlying_array == other
  end

  def equals_array?(array)
    underlying_array == array
  end

  private

  attr_accessor :underlying_array
  attr_writer :length
end
