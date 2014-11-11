require_relative 'message_templates'

class UserInterface
  def initialize
    @message_templates = MessageTemplates.new
  end

  def read_and_validate_user_guess
    loop do
      input = gets
      return input.to_i if valid_input?(input)
      invalid_input_message(input) 
    end
  end

  def intro_message
    puts @message_templates.intro_message
  end

  def game_over_message(won)
    puts won ? @message_templates.game_over_winner_message : @message_templates.game_over_loser_message
  end

  def ask_for_user_guess
    puts @message_templates.enter_guess  
  end

  def turn_output(result)
    puts @message_templates.turn_output(result)
  end

  def invalid_input_message(input)
    puts @message_templates.invalid_input_message(input)
  end

  private

  def valid_input?(input)
    !input.match(/\A\d+\Z/).nil?
  end
end
