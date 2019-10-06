class CLIBestBars::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.worlds50bestbars.com/list-at-a-glance.php"))
  end

  def scrape_bars_index
    self.get_page.css("div.rightContent h2")
  end

  def make_bars
    scrape_bars_index.each do |r|
      CLIBestBars::Bar.new_from_index_page(r)
    end
  end



end