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
end
