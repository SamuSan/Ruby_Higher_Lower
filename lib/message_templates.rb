class MessageTemplates
  def enter_guess
    "Enter your guess: " 
  end

  def turn_output(result)
    "Your guess was #{result.name} than the secret" unless result.won?
  end

  def invalid_input_message(input)
    <<-TEXT
Input must be an integer, ==> #{input} is not one!
Enter your guess:
    TEXT
  end 

  def intro_message
    <<-TEXT
The machine has created a secret number, you have 8 guesses.
You will be told if your guess is lower or higher than the secret.
    TEXT
  end

  def game_over_winner_message
    "Well done, you beat the machine!!"
  end

  def game_over_loser_message
    "The force is weak with this one, try again.."
  end
end