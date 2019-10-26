class Popcorn::User 
  
  attr_reader :name
  
  def initialize
    @name = gets.chomp.to_s
    @name = @name[0].upcase + @name[1..-1].downcase
  end 
  
  def self.get_user_choice
    user_choice = gets.chomp.to_i 
    user_choice
  end 
  
end 