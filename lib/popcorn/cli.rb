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
  end
  
  def get_stats
    titles = Popcorn::Scraper.titles
    weekend = Popcorn::Scraper.weekend
    gross = Popcorn::Scraper.gross
    weeks = Popcorn::Scraper.weeks
    print "Enter the number of the movie you wish to find the stats on: "
    choice = Popcorn::User.get_user_choice - 1
    puts
    puts "Ok! #{titles[choice]}'s weekend gross revenue is #{weekend[choice]} and it's overall gross revenue is #{gross[choice]}. It's been in Top Box Office Status for #{weeks[choice]} week/s."
    puts
  end 
   
end










