require_relative 'response'
require 'pry-byebug'

# Responsible for generating codes and responding to guesses
class Computer
  include Response
  attr_reader :random_code

  def initialize
    @master_set = create_set
    @mutable_set = @master_set.clone
    @last_guess = [1, 1, 2, 2]
  end

  def generate_code
    @random_code = Array.new(4) { rand(1..6) }
  end

  def respond_to_guess(guess)
    generate_response(guess, @random_code.clone)
  end

  def make_guess(last_response)
    return @last_guess if last_response.nil?

    @master_set.delete(@last_guess)
    @mutable_set = remove_same_responses(@mutable_set, last_response)

    @last_guess = find_new_guess(@master_set, @mutable_set.clone)
  end

  def create_set
    [1, 2, 3, 4, 5, 6].repeated_permutation(4).to_a
  end

  def find_new_guess(possible_guesses, remaining_possibilities)
    min_max(remaining_possibilities, remaining_possibilities)
  end

  def min_max(set_of_guesses, remaining_codes)
    scores = {}
    set_of_guesses.each do |guess|
      responses = remaining_codes.map do |code|
        generate_response(guess.clone, code.clone)
      end
      total_responses = count_responses(responses)
      scores[guess] = total_responses.values.max
    end
    break_ties(scores)
  end

  def count_responses(total)
    result = {}
    total.each do |response|
      if result.key?(response)
        result[response] += 1
      else
        result[response] = 1
      end
    end
    result
  end

  def break_ties(response_counts)
    max = response_counts.values.max
    response_counts.each do |key, value|
      next unless value == max

      return key if @mutable_set.include?(key)
    end
    response_counts.key(response_counts.values.max)
  end

  def remove_same_responses(set, response)
    # You know it still could be here
    set.select do |code|
      response == generate_response(code.clone, @last_guess.clone)
    end
  end
end
