require_relative 'interface'

# responsible for making guesses
class Player
  include Interface

  def make_guess
    puts 'Enter 4 numbers in the range 1 - 6 to guess'
    delimiters = [' ', ',', '']
    result = Interface.get_user_input.split(Regexp.union(delimiters))
    until result.size == 4 && (result.all? { |val| (1..6).include? val.to_i })
      puts 'sorry input not recognized, please try again'
      p result
      result = Interface.get_user_input.split(Regexp.union(delimiters))
    end
    result
  end
end
