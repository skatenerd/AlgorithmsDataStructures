class WhoToShakeHandsWith
  def self.shakes(names)
    pairs = []
    names.each do |name|
      names.each do |hand_to_shake|
        unless hand_to_shake == name
          pairs << [name, hand_to_shake]
        end
      end
    end
    pairs
  end
end
