require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/computer'
require_relative 'lib/interface'

def start_game
  puts 'Do you want to be the code maker or code guesser?'
  result = Interface.get_user_input
  until result.downcase == 'guesser' || result.downcase == 'maker'
    puts 'Sorry input not recognized please input "guesser" or "maker"'
    result = Interface.get_user_input
  end
  result.downcase == 'guesser' ? game_loop(true) : game_loop(false)
end

def game_loop(player_is_guesser)
  player = Player.new
  computer = Computer.new
  if player_is_guesser
    board = Board.new(computer.generate_code)
    player_loop(board, player, computer)
  else
    board = Board.new(player.code)
    computer_loop(board, player, computer)
  end
  puts ending_message(board)
end

def player_loop(board, player, computer)
  until game_over?(board)
    puts 'secret code:'
    p computer.random_code
    current_guess = player.make_guess
    current_response = computer.respond_to_guess(current_guess)
    board.update(current_guess, current_response)
    puts board
  end
end

def computer_loop(board, player, computer)
  until game_over?(board)
    puts 'secret code'
    p player.code
    # computer logic
  end
end

def game_over?(board)
  board.turn_limit? || board.correct_guess?
end

def ending_message(board)
  if board.turn_limit?
    'Turn limit reached!'
  elsif board.correct_guess?
    'Code guessed correctly!'
  end
end

start_game
