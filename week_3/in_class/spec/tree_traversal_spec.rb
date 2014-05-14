require 'tree_traversal'
require 'rspec'

describe TreeNode do
  it "flattens a tree in a depth first fashion" do
    root = TreeNode.new(42)
         root.children << TreeNode.new(2)
         root.children << TreeNode.new(8)
             root.children[0].children << TreeNode.new(99)
             root.children[0].children << TreeNode.new(76)
             root.children[1].children << TreeNode.new(0)
             root.children[1].children << TreeNode.new(7)

    expect(root.depth_first_flat_list).to eq([42, 2, 99, 76, 8, 0, 7])
  end

  it "flattens a tree in a breadth first fashion" do
     root = TreeNode.new(42)
         root.children << TreeNode.new(2)
         root.children << TreeNode.new(8)
             root.children[0].children << TreeNode.new(99)
             root.children[0].children << TreeNode.new(76)
             root.children[1].children << TreeNode.new(0)
             root.children[1].children << TreeNode.new(7)
                 root.children[0].children[1].children << TreeNode.new(999)

    expect(root.breadth_first_flat_list).to eq([42, 2, 8, 99, 76, 0, 7, 999])
  end
end

