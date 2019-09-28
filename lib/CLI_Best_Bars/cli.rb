class CLIBestBars::CLI
  def call
    CLIBestBars::Scraper.new.make_bars
    puts "Welcome to your Best Bars concierge.
    I am here to help you find which of the 50 best bars in the world you should frequent next."
    #get_user_bar range or name
    #get_bar_list
    #user chooses bar from list
    start
  end

  def start
    puts ""
    puts "What number bars would you like to see? 1-10, 11-20, 21-30, 31-40, or 41-50?"
    input = gets.strip.to_i

  end

  def print_bar(bar)

  end


  def print_bar(from_number)

  end

end