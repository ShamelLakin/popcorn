class Popcorn::User 
  
  attr_reader :name
  
  def initialize
    @name = gets.chomp.to_s
    @name = @name[0].upcase + @name[1..-1].downcase
  end 
  
  def self.get_user_choice
    user_choice = gets.chomp
    user_choice
  end 
  
  def more_info?
    #ask the user to enter another number for more info or press exit to leave
    #Say goodbye
    #make sure thaey do not type in gibba jabba
  end 
end 