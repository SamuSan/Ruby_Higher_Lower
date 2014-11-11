require 'secret_number'

describe SecretNumber do 
  let(:secret) {SecretNumber.new(100)}

  describe "#secret" do
    it "is smaller than 100" do 
      expect(secret.send(:secret)).to be < 101
    end

    it "is larger than 0" do 
      expect(secret.send(:secret)).to be > 0
    end
  end

  describe "#check_user_guess" do
    before do 
      expect(secret).to receive(:secret).at_least(:once).and_return 20
    end

    it "returns lower result when user guesses lower" do
      result = secret.check_user_guess(10)
    	expect(result.name).to eq "lower"
    end

    it "returns higher result when user guesses higher" do
      result = secret.check_user_guess(21)
      expect(result.name).to eq "higher"
    end

    it "returns equal result when user guesses equal" do
      result = secret.check_user_guess(20)
      expect(result.won?).to eq true
    end
  end
end