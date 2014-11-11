require 'user_interface'
require "secret_number"
require 'message_templates'

describe UserInterface do
	let(:ui) { UserInterface.new }
	let(:secret) { SecretNumber.new(100) }
	let(:template) { MessageTemplates.new }

	describe "#read_and_validate_user_guess" do
		it "accepts a valid input and returns the integer form of the entered number" do
			expect(ui).to receive(:gets).and_return("1234")
			expect(ui.read_and_validate_user_guess).to eq 1234
		end

		it "outputs the correct error message for an invalid intput" do
			expect(ui).to receive(:gets).and_return("XXXX")
			expect(ui).to receive(:puts).with(template.invalid_input_message("XXXX"))
			expect(ui).to receive(:gets).and_return("1234")
			expect(ui.read_and_validate_user_guess).to eq 1234
		end
	end

	describe "#valid_input" do 
		it "returns false for a string" do
			expect(ui.send(:valid_input?,"Hola")).to be false
		end

		it "returns false for a float" do
			expect(ui.send(:valid_input?,"2.23")).to be false
		end

		it "returns true for an integer" do
			expect(ui.send(:valid_input?,"123")).to be true
		end
	end


	describe "#turn_output" do
		it "outputs the correct message when user guess was lower" do
			result = Result::Lower.new
			expect(ui).to receive(:puts).with(template.turn_output(result))
			ui.turn_output(result)
		end

		it "outputs the correct message when user guess is correct" do
			expect(ui).to receive(:puts).with(template.game_over_winner_message)
			ui.game_over_message(true)
		end
	end

	describe "#enter guess" do
		it "displays correct prompt to the user" do
			expect(ui).to receive(:puts).with(template.enter_guess)
			ui.ask_for_user_guess
		end
	end

	describe "#intro_message" do
		it "displays the intro message" do
			expect(ui).to receive(:puts).with(template.intro_message)
			ui.intro_message
		end
	end
	
	describe "#game_over_message" do
		it "displays the outro message when the user wins" do
			expect(ui).to receive(:puts).with(template.game_over_winner_message)
			ui.game_over_message(true)
		end

		it "outputs the correct message when the game is over and the user has not guessed correctly" do
			expect(ui).to receive(:puts).with(template.game_over_loser_message)
			ui.game_over_message(false)
		end
	end
end