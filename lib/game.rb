class Game
  attr_reader :turns, :max_turns

  def initialize(number_of_turns, secret_number)
    @secret_number = secret_number
    @max_turns = number_of_turns
    @turns = 0
    @won = false
  end

  def in_progress?
    remaining_turns > 0 && !won?
  end

  def remaining_turns
    @max_turns - @turns
  end

  def submit_number(number)
    result = secret_number.check_user_guess(number)
    increment_turn
    @won = result.won?
    result
  end

  def won?
    @won
  end

  private

  def increment_turn
    @turns += 1
  end

  def secret_number
    @secret_number
  end
end