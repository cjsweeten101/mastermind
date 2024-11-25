# Responsible for storing game state and checking game over
class Board
  def initialize
    @board_state = { guess_history: [], response_history: [] }
  end

  def update(guess, response)
    @board_state[:guess_history] << guess
    @board_state[:response_history] << response
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
    result.to_s
  end

  def game_over?
    false
  end
end
