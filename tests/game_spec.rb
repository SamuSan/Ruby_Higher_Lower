require 'game'

describe Game do
  let(:secret) {SecretNumber.new(100)}
  let(:game) {Game.new(8, secret)} 

  describe "#in_progress" do
    before do
      expect(secret).to receive(:secret).at_least(:once).and_return 20
    end

    it "is false when the current number of turn equal to the maximum" do
      8.times {game.submit_number(18)}
      expect(game.in_progress?).to be false
    end
  end

  describe "#in_progress" do
    before do
      expect(secret).to receive(:secret).and_return 20
    end

    it "is true when the current number of turn is lower than the maximum" do
      game.submit_number(18)
      expect(game.in_progress?).to be true
    end
  end

  describe "#remaining_turns" do
    before do
      expect(secret).to receive(:secret).and_return 20
    end

    it "is equal to the max number of turns minus current number of turns" do 
      game.submit_number(18)
      expect(game.remaining_turns).to eq 7
    end
  end
end