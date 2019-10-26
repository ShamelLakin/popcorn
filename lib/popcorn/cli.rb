class Popcorn::CLI
  
  def call 
    Popcorn::User.new
    #Welcome message 
    #Choose one one movie out of the top 10 box office movies 
    #give user options after showing of movies (weeknd_revenue, gross_revenue, weeks_in_office, more info link)
    #show results
    #conclude with more info
  end 
  
  def welcome
    print "May I have your name please:"
    puts "Hi, #{Popcorn::User.new.name}"
    binding.pry
  end 
  
end
