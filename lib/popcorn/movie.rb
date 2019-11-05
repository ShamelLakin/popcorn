class Popcorn::Movie
  
  @@scraper_object = Popcorn::Scraper.new
  
   def initialize(title = nil, wknd = nil, gross = nil, weeks = nil)
    @title = title
    @wknd = wknd
    @gross = gross 
    @weeks = weeks
  end
  
   @@all = []

  def self.new_from_index_page(m)
    self.new(
      m.css("td.titleColumn").text.strip,
      m.css("td.ratingColumn").text.strip,
      m.css("td.ratingColumn").text.strip,
      m.css("td.weeksColumn").text.strip.to_i
      )
  end
  
   def titles
    titles = @@scraper_object.make_movies.collect do |mt|
      mt.css("td.titleColumn").text.strip
    end
    
  end
  
  def wknds
    wknds = @@scraper_object.make_movies.collect do |mw|
       mw.css("td.ratingColumn:nth-of-type(odd)").text.strip
    end
  end
  
  def gross
    gross = @@scraper_object.make_movies.collect do |mg|
       mg.css("td.ratingColumn:nth-of-type(even)").text.strip
    end
  end
  
 
 def weeks 
   wks = @@scraper_object.make_movies.collect do |mwks|
     mwks.css("td.weeksColumn").text.strip.to_i
   end
 end 
 
 def synopsis
    ids = @@scraper_object.make_movies.collect do |i|
      i.css("td.titleColumn a").attribute('href').value
    end
    synopsis = ids.collect do |id|
  	   @@scraper_object.get_ind_movie_page(id)
    end
    synopsis
 end 


  def self.all
    @@all
  end
  
end 