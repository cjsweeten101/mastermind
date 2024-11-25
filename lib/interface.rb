# For getting user input
module Interface
  def self.get_user_input # rubocop:disable Naming/AccessorMethodName
    gets.chomp
  end
end
