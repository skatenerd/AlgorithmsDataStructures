require 'who_to_shake_hands_with'
require 'rspec'

describe WhoToShakeHandsWith do
  it "works for 4 people" do
    names = ['walter', 'patrick', 'micah', 'paul']
    shakes = WhoToShakeHandsWith.shakes(names)
    shakes.should =~ [
      ['walter', 'patrick'],
      ['walter', 'micah'],
      ['walter', 'paul'],

      ['patrick', 'walter'],
      ['patrick', 'micah'],
      ['patrick', 'paul'],

      ['micah', 'patrick'],
      ['micah', 'walter'],
      ['micah', 'paul'],

      ['paul', 'patrick'],
      ['paul', 'micah'],
      ['paul', 'walter']
    ]

    # n (names) squared is equal to the total shakes (plus names since people don't shake their own hand)
    # as the number of people increases this relationship will always remain n squared
    (names.count * names.count).should == (shakes.count + names.count)
  end
end
