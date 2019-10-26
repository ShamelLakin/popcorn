class Popcorn::Scraper
 
  @@url = "https://www.imdb.com/chart/boxoffice?ref_=nv_ch_cht"
  @@doc = Nokogiri::HTML(open(@@url))
  
  @@titles = []
 
  def self.get_topbox_titles
    @@doc.css('tbody tr td.titleColumn a').each do |title|
      titles << title.text
    end
  end 
  
  def titles 
    @@titles
  end
  
  def self.get_topbox_revenues
    wknd_rev = []
    gross_rev = []
    
    @@doc.css("tbody tr td.ratingColumn").each do |w_rev|
      if w_rev.css("span").attribute("class")
        gross_rev << w_rev.text.strip
      else 
        wknd_rev << w_rev.text.strip 
      end
    end 
    # binding.pry
  end 
  
  def self.compare_user_choice
  end
  # Ok! #{title}'s weekend gross revenue is #{weekend rev} and it's overall gross revenue is #{gross rev}. It's been in Top Box Office Status for #{week} weeks.
  
end 