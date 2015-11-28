require "card_validator/version"

module CardValidator
  def detect_type(card)
    if [34, 35].include?(card[0..1].to_i) && card.size == 15
      "AMEX"
    elsif card[0..3].to_i == 6011 && card.size == 16
      "Discover"
    elsif (51..55).include?(card[0..1].to_i) && card.size == 16
      "MasterCard"
    elsif card[0] == "4" && [13, 16].include?(card.size)
      "Visa"
    else
      "Unknown"
    end
  end
end
