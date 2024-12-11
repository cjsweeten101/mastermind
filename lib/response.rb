# A module to mix in for responding to guesses
module Response
  def generate_response(guess, secret_code)
    result = { exact: 0, wrong_spot: 0 }
    guess.each_with_index do |num, index|
      if secret_code[index] == num
        result[:exact] += 1
        secret_code[index] = nil
      elsif secret_code.include? num
        idx = secret_code.find_index { |val| val == num }
        check_for_future_matches(idx, secret_code, guess, result)
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
