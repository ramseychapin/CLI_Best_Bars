class CLIBestBars::Bar

  attr_accessor :name, :rank, :url, :website_url, :description

  @@all = []

  def self.new_from_index_page(r)
    self.new(
      r.css("h2 a").text,
      r.css("h2").text,
      r.css("h2 a").attribute("href").text
      )
    binding.pry
  end

  def initialize(name=nil, rank=nil, url=nil)
    @name = name
    @rank = rank
    @url = url
    @@all << self
    #binding.pry
  end

  def self.all
    @@all
  end

  def self.find(id)
    @@all[id-1]
  end

end