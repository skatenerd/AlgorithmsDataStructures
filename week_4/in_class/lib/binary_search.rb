class BinarySearch
  def self.contains?(elements, item)
    bottom = 0
    top = elements.length - 1
    while(top >= bottom)
      middle = (bottom + top) / 2
      at_middle = elements.get(middle)
      if(at_middle == item)
        return true
      end
      if(at_middle < item)
        bottom = middle + 1
      else
        top = middle - 1
      end
    end
    return false
  end
end
