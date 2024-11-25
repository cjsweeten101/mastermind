require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/computer'

computer = Computer.new
player = Player.new
board = Board.new

until board.game_over?
  puts 'secret code:'
  p computer.random_code
  current_guess = player.make_guess
  current_response = computer.respond_to_guess(current_guess)
  board.update(current_guess, current_response)
  puts board
end
