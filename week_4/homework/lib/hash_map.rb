require_relative '../../in_class/lib/hash_function'

class HashMap
  attr_accessor :backing_array, :factor

  def initialize(factor = 2)
    self.backing_array = Array.new(2)
    self.factor = factor
  end

  def get(key)
    # hash for index
  end

  def set(key, obj)
    enlarge if needs_expanding?
    # add at hashed index
  end

  private

  def needs_expanding?
    backing_array.compact.size > (backing_array.size / factor)
  end

  def enlarge
    next_backing_array = Array.new(backing_array.size * factor)
    # copy
    self.backing_array = next_backing_array
  end
end
