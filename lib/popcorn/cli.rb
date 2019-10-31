class Popcorn::CLI
  
  def call 
    welcome 
    show_top_ten 
    get_stats
  end 
  
  def welcome
    print "Welcome to Popcorn, Where we give you the top ten box office movies and more,
    May I have your name please: "
    @name = Popcorn::User.new.name 
    puts
    puts "Hi, #{@name}. Here's a list of the current top 10 box office movies"
    puts
  end 
  
  def show_top_ten
    Popcorn::Scraper.get_topbox_titles.each.with_index(1) do |title, index|
      puts "#{index}. #{title}"
    end 
     puts
  end
  
  
  def get_stats
  
    while true
      puts "\nEnter the number of the movie you wish to find the stats on or type exit: "
      choice = Popcorn::User.get_user_choice
        
      if choice == "exit"
        goodbye
      else
        choice = choice.to_i - 1
        puts "\n\nOk! #{Popcorn::Scraper.get_topbox_titles[choice]}'s weekend gross revenue is #{Popcorn::Scraper.get_topbox_weekend[choice]} and it's overall gross revenue is #{Popcorn::Scraper.get_topbox_gross[choice]}. It's been in Top Box Office Status for #{Popcorn::Scraper.get_topbox_weeks[choice]} week/s.\n\nSynopsis >\n====================\n\n#{Popcorn::Scraper.get_movie_synopsis[choice]}"
      end
    end
    
  end
   
  def goodbye
    puts "\nSee you next time #{@name}, Enjoy the show!"
    exit!
  end 
end










