require 'spec_helper'


describe CardValidator do
  include CardValidator

  it "should detect AMEX card" do
    expect(detect_type("341111111111111")).to eq("AMEX")
  end
end
