require "card_validator/version"

module CardValidator
  def detect_type(card)
    if card.start_with?("34", "35") && card.size == 15
      "AMEX"
    elsif card.start_with?("6011") && card.size == 16
      "Discover"
    elsif card.start_with?(*(51..55).map(&:to_s)) && card.size == 16
      "MasterCard"
    elsif card.start_with?("4") && [13, 16].include?(card.size)
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
