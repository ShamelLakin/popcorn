class Popcorn::Scraper
 
  @@url = "https://www.imdb.com/chart/boxoffice?ref_=nv_ch_cht"
  @@doc = Nokogiri::HTML(open(@@url))
 
  def self.get_topbox_titles
    titles = []
    @@doc.css('tbody tr td.titleColumn a').each do |title|
      titles << title.text
    end
    titles
  end 
  
end 