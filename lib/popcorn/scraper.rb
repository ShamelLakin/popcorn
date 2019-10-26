class Popcorn::Scraper
 
  @@url = "https://www.imdb.com/chart/boxoffice?ref_=nv_ch_cht"
  @@doc = Nokogiri::HTML(open(@@url))
  
  @@titles = []
  @@wknd_rev = []
  @@gross_rev = []
  @@weeks = []
 
  def self.get_topbox_titles
    @@doc.css('tbody tr td.titleColumn a').each do |title|
      titles << title.text
    end
  end 
  
  def self.get_topbox_revenues
    
    @@doc.css("tbody tr td.ratingColumn").each do |w_rev|
      if w_rev.css("span").attribute("class")
        @@gross_rev << w_rev.text.strip
      else 
        @@wknd_rev << w_rev.text.strip 
      end
    end 
    # binding.pry
  end 
  
  def self.get_topbox_weeks
    @@doc.css("tbody tr td.weeksColumn").each do |week|
      @@weeks << week.text.to_i
    end
  end 
  
  def self.use_users_choice
    choice = Popcorn::User.get_user_choice - 1
    puts "Ok! #{titles[choice]}'s weekend gross revenue is #{weekend[choice]} and it's overall gross revenue is #{gross[choice]}. It's been in Top Box Office Status for #{weeks[choice]} week/s."
  end
  
  def titles 
    @@titles
  end
  
  def gross
    @@gross_rev
  end
  
  def weekend 
    @@wknd_rev
  end
  
  def weeks 
    @@weeks
  end 
end 




