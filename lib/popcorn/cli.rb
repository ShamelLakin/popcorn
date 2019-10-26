class Popcorn::CLI
  
  def call 
    welcome 
    show_top_ten 
    get_stats
    #give user options for more info link)
    #show results
    #conclude with more info
  end 
  
  def welcome
    print "May I have your name please: "
    name = Popcorn::User.new.name 
    puts
    puts "Hi, #{name}. Here's a list of the current top 10 box office movies"
    puts
  end 
  
  def show_top_ten
    Popcorn::Scraper.get_topbox_titles.each.with_index(1) do |title, index|
      puts "#{index}. #{title}"
    end 
    puts
  end
  
  def get_stats
    print "Enter the number of the movie you wish to find the stats on: "
    choice = Popcorn::User.get_user_choice - 1
    puts
    puts "Ok! #{Popcorn::Scraper.get_topbox_titles[choice]}'s weekend gross revenue is #{Popcorn::Scraper.get_topbox_revenues[choice]} and it's overall gross revenue is #{Popcorn::Scraper.gross[choice]}. It's been in Top Box Office Status for #{Popcorn::Scraper.weeks[choice]} week/s."
    puts
  end 
   
end










