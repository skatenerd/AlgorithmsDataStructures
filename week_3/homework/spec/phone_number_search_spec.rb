require 'set'
require 'phone_number_search'

describe PhoneNumberSearch do
  describe ".build_tree" do
    xit "builds a tree representing potential words" do
      phone_number = [2,3]
      tree = PhoneNumberSearch.build_tree(phone_number)
      tree.children.count.should == 3
      leaves = tree.children[0].children.map(&:value) +
        tree.children[1].children.map(&:value) +
        tree.children[2].children.map(&:value)
      leaves.should =~ [
        "ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"
      ]
    end
  end

  describe ".enumerate_strings" do
    xit "enumerates the potential strings of a phone number" do
      phone_number = [2,3]
      PhoneNumberSearch.enumerate_strings(phone_number).should =~ [
        "a", "b", "c", "ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"
      ]
    end
  end

  describe ".subwords_of" do
    before(:each) do
      @dictionary = Set.new(["bean", "beans", "skills", "kills"])
    end

    xit "knows when a string is not made up of any legal words" do
      expect(PhoneNumberSearch.subwords_of("ixjlkwifh", @dictionary)).to eq([])
    end

    xit "knows when a string is made up of a repeated word" do
      expect(PhoneNumberSearch.subwords_of("beanbean", @dictionary)).to eq([["bean", "bean"]])
    end

    xit "knows when a string is made up of two words" do
      expect(PhoneNumberSearch.subwords_of("beanskills", @dictionary)).to eq([
                                                                             ["bean", "skills"],
                                                                             ["beans", "kills"]
      ])
    end

    xit "knows when a string is made up of many words" do
      expect(PhoneNumberSearch.subwords_of("beanbeanbeansbeanbean", @dictionary)).to eq([
        ["bean", "bean", "beans", "bean", "bean"]
      ])
    end
  end

  describe "coup de gras" do
    xit 'finds word combinations for a phone number' do
      dictionary = Set.new(["user", "uby", "use", "ruby"])
      breakdowns = PhoneNumberSearch.find_word_breakdowns([
        8, 7, 3, 7, 8, 2, 9
      ], dictionary)
      breakdowns.should =~ [['user', 'uby'], ['use', 'ruby']]
    end
  end
end
