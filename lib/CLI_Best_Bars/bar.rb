class CLIBestBars::Bar

  attr_accessor :name, :rank, :url, :location
  attr_reader :descripton, :website_url, :address

  @@all = []

  def self.new_from_index_page(r)
    self.new(
      r.css("a").text.split(" ").map{|word| word.capitalize}.join(" "),
      r.text[0..1].gsub(/[\s.]/ ,""),
      r.next_element.text,
      "https://www.worlds50bestbars.com/#{r.css("a").attribute("href").text}"
      )
  end

  def initialize(name=nil, rank=nil, location = nil, url=nil)
    @name = name
    @rank = rank
    @location = location
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    @@all[id-1]
  end

  def description
    @description ||= doc.css("div.rightContent").css("p")[1].text
    
  end

  def website_url
    @website_url ||= doc.css("div.rightContent").css("h2").css("a").attribute("href").text
  end

  def address
    @address ||= doc.css("div.rightContent").css("p")[0].text
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

end