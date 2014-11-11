require 'result'

describe Result do 
  describe "#won?" do
    it "returns false for lower" do
      result = Result::Lower.new
      expect(result.won?).to be false
    end

    it "returns false for higher" do
      result = Result::Higher.new
      expect(result.won?).to be false
    end

    it "returns false for lower" do
      result = Result::Equal.new
      expect(result.won?).to be true
    end
  end
end