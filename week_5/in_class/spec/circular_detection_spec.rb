require 'circular_detection'
require 'rspec'
require_relative '../../examples/lib/graph'

describe CircularDetection do
  it "knows when a graph is not circular" do
    n = Vertex.new(1)
    expect(CircularDetection.part_of_cycle?(n)).to be_false

    n1 = Vertex.new(1)
    n2 = Vertex.new(2)
    n1.edges << DirectedEdge.new(n2)
    n3 = Vertex.new(3)
    n4 = Vertex.new(4)
    n2.edges << DirectedEdge.new(n3)
    n2.edges << DirectedEdge.new(n4)
    n3.edges << DirectedEdge.new(n4)
    expect(CircularDetection.part_of_cycle?(n1)).to be_false
  end

  it "knows when a graph is circular" do
    n1 = Vertex.new(1)
    n2 = Vertex.new(2)
    n1.edges << DirectedEdge.new(n2)
    n2.edges << DirectedEdge.new(n1)
    expect(CircularDetection.part_of_cycle?(n1)).to be_true

    n1 = Vertex.new(1)
    n2 = Vertex.new(2)
    n1.edges << DirectedEdge.new(n2)
    n3 = Vertex.new(3)
    n4 = Vertex.new(4)
    n2.edges << DirectedEdge.new(n3)
    n2.edges << DirectedEdge.new(n4)
    n4.edges << DirectedEdge.new(n2)
    expect(CircularDetection.part_of_cycle?(n3)).to be_false
    expect(CircularDetection.part_of_cycle?(n4)).to be_true
  end
end
