require_relative 'secret_number'
require_relative 'game'
require_relative 'user_interface'

secret = SecretNumber.new(100)
game = Game.new(8, secret)
ui = UserInterface.new

ui.intro_message

while game.in_progress?
  ui.ask_for_user_guess
  number = ui.read_and_validate_user_guess
  result = game.submit_number(number)
  ui.turn_output(result)
end

ui.game_over_message(game.won?)
