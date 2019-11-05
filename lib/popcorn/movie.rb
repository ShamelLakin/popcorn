class Popcorn::Movie
  
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

  def self.all
    @@all
  end
  
end 