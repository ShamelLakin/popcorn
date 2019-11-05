class Popcorn::Scraper
 
  def get_page
    Nokogiri::HTML(open("https://www.imdb.com/chart/boxoffice?ref_=nv_ch_cht"))
  end 
 
  def scrape_movie_index
    self.get_page.css("tbody tr")
  end 
 
  def make_movies
    movie = Popcorn::Movie
      scrape_movie_index.each do |m|
        movie.new_from_index_page(m)
      end
  end
  
  # def titles
  #   make_movies.each do |mt|
  #     puts mt.css("td.titleColumn").text.strip
  #   end
  # end
  
  def wknd
    make_movies.each do |mt|
      puts mt.css("td.ratingColumn").text.strip
    end
    binding.pry
  end
  
 
  # def self.get_topbox_titles
  #   @@doc.css('tbody tr td.titleColumn a').each do |title|
  #     @@titles << title.text
  #   end
  #   @@titles
  # end 
  
  # def self.get_topbox_weekend
  #   @@doc.css("tbody tr td.ratingColumn").each do |w_rev|
  #     if !(w_rev.css("span").attribute("class"))
  #       @@weekend << w_rev.text.strip 
  #     end
  #   end 
  #   @@weekend
  # end 
  
  # def self.get_topbox_gross
  #   @@doc.css("tbody tr td.ratingColumn").each do |w_rev|
  #     if w_rev.css("span").attribute("class")
  #       @@gross << w_rev.text.strip
  #     end
  #   end 
  #   @@gross
  # end 
  
  #-============
  
  
#   def self.get_topbox_weeks
#     @@doc.css("tbody tr td.weeksColumn").each do |week|
#       @@weeks << week.text.to_i
#     end
#     @@weeks
#   end 
  
#   def self.get_movie_synopsis
# 	ids = []
#     @@doc.css("tbody td.titleColumn a").each do |title|
#   		ids << title.attribute('href').value
# 	end
# 	ids.each do |id|
#   		@@info << Nokogiri::HTML(open("https://www.imdb.com#{id}")).css("div.summary_text").text.strip 
#     end
#     @@info
#   end
    
end 




