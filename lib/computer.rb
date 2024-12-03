require_relative 'response'

# Responsible for generating codes and responding to guesses
class Computer
  include Response
  attr_reader :random_code

  def generate_code
    @random_code = Array.new(4) { rand(1..6) }
  end

  def respond_to_guess(guess)
    generate_response(guess, @random_code.clone)
  end

  def check_for_future_matches(idx, code, guess, result)
    if code[idx] == guess[idx]
      result[:exact] += 1
    else
      result[:wrong_spot] += 1
    end
    code[idx] = nil
  end
end
