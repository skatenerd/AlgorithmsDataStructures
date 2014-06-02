class Vertex
  attr_accessor :value, :edges

  def initialize(value)
    @value = value
    @edges = []
  end
end

class DirectedEdge # http://conceptcrucible.com/wp-content/uploads/2013/08/The-Edge-rock-guitar-legends-32140429-320-240.jpg
  attr_reader :to

  def initialize(to)
    @to = to
  end
end

class Edge
  attr_reader :n1, :n2

  def initialize(n1, n2)
    @n1 = n1
    @n2 = n2
  end
end
