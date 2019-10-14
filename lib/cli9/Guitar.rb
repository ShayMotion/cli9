class GuitarGallery::Guitar
  attr_reader :name, :rating, :summary
  @@all = []

  def initialize(name, rating, summary)
    @name = name
    @rating = rating
    @summary = summary
    @guitars = []
  save
  end

  def self.all
    GuitarGallery::Scraper.scrape_guitars if @@all.empty?
     @@all
    end
    
  
  def save
    @@all << self
    end

end

