# Responsible for generating codes and responding to guesses
class Computer
  attr_reader :random_code

  def generate_code
    @random_code = Array.new(4) { rand(1..6) }
  end

  def respond_to_guess(guess)
    result = { exact: 0, wrong_spot: 0 }
    code_copy = @random_code.clone
    guess.each_with_index do |num, index|
      if code_copy[index] == num
        result[:exact] += 1
        code_copy[index] = nil
      elsif code_copy.include? num
        idx = code_copy.find_index { |val| val == num }
        check_for_future_matches(idx, code_copy, guess, result)
      end
    end
    result
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
