# Responsible for generating codes and responding to guesses
class Computer
  attr_reader :random_code

  def initialize
    @random_code = generate_code
  end

  def generate_code
    Array.new(4) { rand(6) }
  end
end
