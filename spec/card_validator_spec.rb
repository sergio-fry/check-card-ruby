require 'spec_helper'


describe CardValidator do
  include CardValidator

  describe "#detect_type" do
    {
      AMEX: {
        good: ["341111111111111", "351111111111111"],
        bad:      ["34111111111111",  "3511111111111111", "881111111111111"],
      },
      Discover: {
        good: ["6011111111111111"],
        bad:      ["601111111111111", "60111111111111111"]
      },
      MasterCard: {
        good: ["5111111111111111", "5211111111111111", "5311111111111111", "5411111111111111", "5111111111111111", ],
        bad:      ["511111111111111",  "52111111111111111", "5011111111111111"]
      },
      Visa: {
        good: ["4111111111111", "4111111111111111"],
        bad:      ["411111111111",  "41111111111111111", "9111111111111111"]
      },
    }.each do |type, data|
      describe "card type #{type}" do
        data[:good].each do |card|
          it "should detect card #{card} (size: #{card.size})" do
            expect(detect_type(card)).to eq(type.to_s)
          end
        end

        data[:bad].each do |card|
          it "should not detect card #{card} (size: #{card.size})" do
            expect(detect_type(card)).to eq("Unknown")
          end
        end
      end
    end
  end

  describe "#luhn_check_step1" do
    {
      "1234" => [2, 2, 6, 4],
      "4408041234567893" => %w(8 4 0 8 0 4 2 2 6 4 10 6 14 8 18 3).map(&:to_i),
    }.each do |from, to|
      it "should convert #{from} to #{to}" do
        expect(luhn_check_step1(from)).to eq(to)
      end
    end
  end

  describe "#luhn_check" do
    {
      "1234" => false,
      "4408041234567893" => true,
      "4417123456789112" => false,
    }.each do |arg, result|
      it "should be #{result} when #{arg} passed" do
        expect(luhn_check(arg)).to eq(result)
      end
    end
  end
end
