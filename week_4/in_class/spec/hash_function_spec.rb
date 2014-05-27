require 'hash_function'
require 'rspec'

describe HashFunction do
  it "is a pure function" do
    result = HashFunction.hash("example")
    expect(result).to eq(result)
  end

  it "returns an integer larger than 0" do
    ["", "foobar", "*" * 32_001].each do |input|
      result = HashFunction.hash(input)
      expect(result.class).to eq(Fixnum)
      expect(result).to be >= 0
    end
  end

  it "does not collide results" do
    result1 = HashFunction.hash("abc")
    result2 = HashFunction.hash("def")

    expect(result1).to_not eq(result2)
  end
end
