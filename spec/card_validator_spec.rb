require 'spec_helper'


describe CardValidator do
  include CardValidator

  describe "#detect_type" do
    describe "AMEX" do
      it "should detect card" do
        expect(detect_type("341111111111111")).to eq("AMEX")
        expect(detect_type("351111111111111")).to eq("AMEX")
      end

      it "should reject card when length != 15" do
        expect(detect_type("34111111111111")).to eq("Unknown")
        expect(detect_type("3511111111111111")).to eq("Unknown")
      end

      it "should reject card when start not from 34/35" do
        expect(detect_type("331111111111111")).to eq("Unknown")
      end
    end

    describe "Discover" do
      it "should detect card" do
        expect(detect_type("6011111111111111")).to eq("Discover")
      end

      it "should reject card when length != 16" do
        expect(detect_type("601111111111111")).to eq("Unknown")
        expect(detect_type("60111111111111111")).to eq("Unknown")
      end

      it "should reject card when start not from 34/35" do
        expect(detect_type("5011111111111111")).to eq("Unknown")
      end
    end

  end
end
