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
    @top_ten = Popcorn::Movie.new
    @top_ten.titles.each.with_index(1) do |title, index|
      puts "#{index}. #{title}"
    end 
  end
  
  
  def get_stats
  
    while true
      puts "\nEnter the number of the movie you wish to find the stats on or type exit: "
      choice = Popcorn::User.get_user_choice
        
      if choice == "exit"
        goodbye
      else
        choice = choice.to_i - 1
        puts "\n\nOk! #{@top_ten.titles[choice]}'s weekend gross revenue is #{@top_ten.wknds[choice]} and it's overall gross revenue is #{@top_ten.gross[choice]}. It's been in Top Box Office Status for #{@top_ten.weeks[choice]} week/s.\n\nSynopsis >\n====================\n\n#{@top_ten.synopsis[choice]}"
      end
    end
    
  end
   
  def goodbye
    puts "\nSee you next time #{@name}, Enjoy the show!"
    exit!
  end 
end










