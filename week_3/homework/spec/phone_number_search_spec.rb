require 'set'

describe PhoneNumberSearch do
  before(:each) do
    @dictionary = Set.new(["bean", "beans", "skills", "kills"])
  end

  it "knows when a string is not made up of any legal words" do
    expect(PhoneNumberSearch.subwords_of("ixjlkwifh", @dictionary)).to eq([])
  end

  it "knows when a string is made up of a repeated word" do
    expect(PhoneNumberSearch.subwords_of("beanbean", @dictionary)).to eq([["bean", "bean"]])
  end

  it "knows when a string is made up of two words" do
    expect(PhoneNumberSearch.subwords_of("beanskills", @dictionary)).to eq([
      ["bean", "skills"],
      ["beans", "kills"]
    ])
  end

  it "knows when a string is made up of many words" do
    expect(PhoneNumberSearch.subwords_of("beanbeanbeansbeanbean", @dictionary)).to eq([
      ["bean", "bean", "beans", "bean", "bean"]
    ])
  end
end
