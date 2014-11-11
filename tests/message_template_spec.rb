require 'message_templates'

describe MessageTemplates do
  let(:template) { MessageTemplates.new }
   
  describe "#user_input_prompt" do
    it "displays the correct message to prompt the user for input" do
      expect(template.enter_guess).to eq("Enter your guess: ")
    end
  end
end