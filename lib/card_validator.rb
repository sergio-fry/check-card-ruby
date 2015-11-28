require "card_validator/version"

module CardValidator
  def detect_type(card)
    if [34, 35].include?(card[0..1].to_i) && card.size == 15
      "AMEX"
    end
  end
end
