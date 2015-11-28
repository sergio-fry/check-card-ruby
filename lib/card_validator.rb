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

  def luhn_check(card)
    step1 = luhn_check_step1(card)
    step2 = step1.join.chars.map(&:to_i).inject{ |sum, x| sum + x }
    step3 = step2 % 10

    step3 == 0
  end

  def luhn_check_step1(card)
    numbers = []

    card.chars.map(&:to_i).each_with_index do |digit, index|
      digit *= 2 if index % 2 == 0

      numbers << digit
    end

    numbers
  end
end
