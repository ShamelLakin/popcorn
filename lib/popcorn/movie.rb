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
      m.css("td.titleColumn").text,
      m.css("td.ratingColumn").text,
      m.css("td.ratingColumn").text,
      m.css("td.weeksColumn").text
      )
  end

  def self.all
    @@all
  end
  
end 