class Popcorn::Scraper
  
  attr_accessor :titles
 
  def get_page
    Nokogiri::HTML(open("https://www.imdb.com/chart/boxoffice?ref_=nv_ch_cht"))
  end 
 
  def scrape_movie_index
    self.get_page.css("tbody tr")
  end 
 
  def make_movies
      scrape_movie_index.each do |m|
        Popcorn::Movie.all << Popcorn::Movie.new_from_index_page(m)
      end
  end
  
  def titles
    titles = make_movies.collect do |mt|
      mt.css("td.titleColumn").text.strip
    end
    
  end
  
  def wknds
    wknds = make_movies.collect do |mw|
       mw.css("td.ratingColumn:nth-of-type(odd)").text.strip
    end
  end
  
  def gross
    gross = make_movies.collect do |mg|
       mg.css("td.ratingColumn:nth-of-type(even)").text.strip
    end
  end
  
 
 def weeks 
   wks = make_movies.collect do |mwks|
     mwks.css("td.weeksColumn").text.strip.to_i
   end
 end 
 
 def synopsis
    ids = make_movies.collect do |i|
      i.css("td.titleColumn a").attribute('href').value
    end
    synopsis = ids.collect do |id|
  	  Nokogiri::HTML(open("https://www.imdb.com#{id}")).css("div.summary_text").text.strip 
    end
    synopsis
 end 

end 




