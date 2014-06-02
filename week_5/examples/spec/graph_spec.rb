require 'graph'
require 'rspec'

describe "graphs" do
  it "makes a circular graph" do
    n1 = Vertex.new(1)
    n2 = Vertex.new(2)
    n1.edges << DirectedEdge.new(n2)
    n2.edges << DirectedEdge.new(n1)

    n1.edges.first.to.edges.first.to.should == n1
  end

  it "makes a cirulcar undirected graph" do
    n1 = Vertex.new(1)
    n2 = Vertex.new(2)
    e = Edge.new(n1, n2)
    n1.edges << e
    n2.edges << e
    n1.edges.first.n2.edges.first.n1.should == n1
  end
end
