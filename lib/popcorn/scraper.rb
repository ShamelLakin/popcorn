class Popcorn::Scraper
 
  def get_page
    Nokogiri::HTML(open("https://www.imdb.com/chart/boxoffice?ref_=nv_ch_cht"))
  end 
  
  def get_ind_movie_page(id_of_movie)
    Nokogiri::HTML(open("https://www.imdb.com#{id_of_movie}")).css("div.summary_text").text.strip
  end 
 
  def scrape_movie_index
    self.get_page.css("tbody tr")
  end 
 
  def make_movies
      scrape_movie_index.each do |m|
        Popcorn::Movie.all << Popcorn::Movie.new_from_index_page(m)
      end
  end

end 




