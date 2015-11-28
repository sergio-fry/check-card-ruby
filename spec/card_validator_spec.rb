require 'spec_helper'


describe CardValidator do
  include CardValidator

  describe "#detect_type" do
    {
      AMEX: {
        examples: ["341111111111111", "351111111111111"],
        bad:      ["34111111111111",  "3511111111111111", "881111111111111"],
      },
      Discover: {
        examples: ["6011111111111111"],
        bad:      ["601111111111111", "60111111111111111"]
      },
      MasterCard: {
        examples: ["5111111111111111", "5211111111111111", "5311111111111111", "5411111111111111", "5111111111111111", ],
        bad:      ["511111111111111",  "52111111111111111", "5011111111111111"]
      },
    }.each do |type, data|
      describe "card type #{type}" do
        data[:examples].each do |card|
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
end
