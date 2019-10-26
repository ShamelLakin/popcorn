class Popcorn::User 
  
  attr_reader :name
  
  def initialize
    @name = gets.chomp.to_s
    @name = @name[0].upcase + @name[1..-1].downcase
  end 
  
  def self.get_user_choice
    print "Enter the number of the movie you wish to find the stats on: "
    user_choice = gets.chomp.to_i 
    puts
    user_choice
  end 
  
end 