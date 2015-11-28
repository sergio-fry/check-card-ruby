require 'spec_helper'


describe CardValidator do
  include CardValidator

  describe "#detect_type" do
    it "should detect AMEX" do
      expect(detect_type("341111111111111")).to eq("AMEX")
      expect(detect_type("351111111111111")).to eq("AMEX")
    end

    it "should reject AMEX when length != 15" do
      expect(detect_type("34111111111111")).not_to eq("AMEX")
      expect(detect_type("3511111111111111")).not_to eq("AMEX")
    end

    it "should reject AMEX when start not from 34/35" do
      expect(detect_type("331111111111111")).not_to eq("AMEX")
    end
  end
end
