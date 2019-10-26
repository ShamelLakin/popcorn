class Popcorn::Scraper
 
  
  def self.get_topbox 
    url = "https://www.imdb.com/chart/boxoffice?ref_=nv_ch_cht"
    doc = Nokogiri::HTML(open(url))
    titles = []
    doc.css('tbody tr td.titleColumn a').each do |title|
      titles << title.text
      binding.pry
    end
  end 
  
end 