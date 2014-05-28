require 'hash_map'
require 'rspec'

describe HashMap do
  it "is nil when retrieving a not found object" do
    map = HashMap.new
    expect(map.get("foobar")).to be_nil
  end

  it "sets and gets an object" do
    map = HashMap.new
    map.set("test", "ing")
    expect(map.get("test")).to eq("ing")
  end

  it "doubles the size with a factor of 2" do
    map = HashMap.new
    map.set("test", "ing")
    expect(map.backing_array.size).to eq(2)
    map.set("more", "testing")
    expect(map.backing_array.size).to eq(4)
  end

  it "handles conflicts" do
    map = HashMap.new
    map.set("key", "val1")
    map.set("key", "val2")
    expect(map.get("key")).to eq("val2")
  end
end
