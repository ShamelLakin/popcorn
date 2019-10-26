class Popcorn::Scraper
 
  @@url = "https://www.imdb.com/chart/boxoffice?ref_=nv_ch_cht"
  @@doc = Nokogiri::HTML(open(@@url))
  
  @@titles = []
  @@weekend = []
  @@gross = []
  @@weeks = []
 
  def self.get_topbox_titles
    @@doc.css('tbody tr td.titleColumn a').each do |title|
      @@titles << title.text
    end
    @@titles
  end 
  
  def self.get_topbox_weekend
    @@doc.css("tbody tr td.ratingColumn").each do |w_rev|
      if !(w_rev.css("span").attribute("class"))
        @@weekend << w_rev.text.strip 
      end
    end 
    @@weekend
  end 
  
   def self.get_topbox_gross
    @@doc.css("tbody tr td.ratingColumn").each do |w_rev|
      if w_rev.css("span").attribute("class")
        @@gross << w_rev.text.strip
      end
    end 
    @@gross
  end 
  
  
  def self.get_topbox_weeks
    @@doc.css("tbody tr td.weeksColumn").each do |week|
      @@weeks << week.text.to_i
    end
    @@weeks
  end 
  
  # def self.titles 
  #   @@titles
  # end
  
  # def self.gross
  #   @@gross
  # end
  
  # def self.weekend 
  #   @@weekends
  # end
  
  # def self.weeks 
  #   @@weeks
  # end 
end 




