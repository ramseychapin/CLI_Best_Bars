class CLIBestBars::Bar

  attr_accessor :name, :position, :location, :url, :website_url, :description

  @@all = []

  def initialize(name=nil, location=nil, position=nil, url=nil)
    @name = name
    @location = location
    @position = position
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

end