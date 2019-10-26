class Popcorn::CLI
  
  def call 
    welcome 
    show_top_ten
    #Choose one one movie out of the top 10 box office movies for further info 
    #give user options after showing of movies (weeknd_revenue, gross_revenue, weeks_in_office, more info link)
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
  
  
end










