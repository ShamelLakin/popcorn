class Popcorn::CLI
  
  def call 
    welcome
    #Welcome message 
    #Choose one one movie out of the top 10 box office movies 
    #give user options after showing of movies (weeknd_revenue, gross_revenue, weeks_in_office, more info link)
    #show results
    #conclude with more info
  end 
  
  def welcome
    puts "May I have your name please:"
    puts "Hi, #{Popcorn::User.new.name}. Here's a list of the current top 10 box office movies"
    puts
    # binding.pry
  end 
  
end
