require 'chained_hash_map'
require 'rspec'

describe ChainedHashMap do
  it "is an empty array when retrieving a not found object" do
    map = ChainedHashMap.new
    expect(map.get("foobar")).to be_empty
  end

  it "sets and gets an object" do
    map = ChainedHashMap.new
    map.set("test", "ing")
    expect(map.get("test")).to eq(["ing"])
  end

  it "appends to the inner list when colloding" do
    map = ChainedHashMap.new
    map.set("key", "val1")
    map.set("key", "val2")
    expect(map.get("key")).to eq(["val1", "val2"])
  end
end
