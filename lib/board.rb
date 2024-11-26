# Responsible for storing game state and checking game over
class Board
  def initialize(code)
    @secret_code = code
    @board_state = { guess_history: [], response_history: [] }
    @turn_count = 0
  end

  def update(guess, response)
    @board_state[:guess_history] << guess
    @board_state[:response_history] << response
    @turn_count += 1
  end

  def to_s
    result = "History:\n"
    @board_state[:guess_history].each_with_index do |guess, index|
      result << "Guess: #{guess} Response: "
      result << @board_state[:response_history][index].reduce('') do |sum, val|
        sum + "#{val[0]}: #{val[1]} "
      end
      result << "Turn: #{index + 1}\n"
    end
    result
  end

  def correct_guess?(current_guess)
    current_guess == @secret_code
  end

  def turn_limit?
    @turn_count >= 12
  end
end
