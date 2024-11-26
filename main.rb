require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/computer'
require_relative 'lib/interface'

computer = Computer.new
player = Player.new
board = Board.new(computer.random_code)
current_guess = 0

until board.turn_limit? || board.correct_guess?(current_guess)
  puts 'secret code:'
  p computer.random_code
  current_guess = player.make_guess
  current_response = computer.respond_to_guess(current_guess)
  board.update(current_guess, current_response)
  puts board
end

if board.turn_limit?
  puts 'Turn limit reached!'
elsif board.correct_guess?(current_guess)
  puts 'Code guessed correctly!'
end
