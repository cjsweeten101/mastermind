require_relative 'interface'
require_relative 'response'

# responsible for making guesses
class Player
  include Interface
  include Response
  attr_reader :code

  def make_guess
    puts 'Enter 4 numbers in the range 1 - 6 to guess'
    delimiters = [' ', ',', '']
    result = Interface.get_user_input.split(Regexp.union(delimiters))
    until result.size == 4 && (result.all? { |val| (1..6).include? val.to_i })
      puts 'sorry input not recognized, please try again'
      result = Interface.get_user_input.split(Regexp.union(delimiters))
    end
    result.map(&:to_i)
  end

  def generate_code
    puts 'Enter 4 numbers in the range 1 - 6 to choose a secret code'
    delimiters = [' ', ',', '']
    result = Interface.get_user_input.split(Regexp.union(delimiters))
    until result.size == 4 && (result.all? { |val| (1..6).include? val.to_i })
      puts 'sorry input not recognized, please try again'
      result = Interface.get_user_input.split(Regexp.union(delimiters))
    end
    @code = result.map(&:to_i)
  end

  def respond_to_guess(guess)
    generate_response(guess, @code.clone)
  end
end
