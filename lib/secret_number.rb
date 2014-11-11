require_relative 'result'

class SecretNumber
	def initialize(upper_limit)
		@secret = rand(1..upper_limit)
	end

  def check_user_guess(user_guess)
    if user_guess < secret
      Result::Lower.new
    elsif user_guess > secret
      Result::Higher.new
    else
      Result::Equal.new
    end
  end

  private 

  def secret
    @secret
  end
end
