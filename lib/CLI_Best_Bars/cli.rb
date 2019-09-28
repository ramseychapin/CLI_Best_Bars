class CLIBestBars::CLI
  def call
    #CLIBestBars::Scraper.new.make_bars
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

    print_bar(input)

    puts ""
    puts "What bar would you like to learn more about?"
    input = gets.strip

    #bar = CLIBestBars::Bar.find(input.to_i)

    #print_bar(bar)

    puts ""
    puts "Would you like to learn about another bar? Enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    elsif input == "n"
      puts ""
      puts "Thank you! Go enjoy some cocktails"
      exit
    else
      puts ""
      puts "I don't understand that answer. Please respond Y or N."
      start
    end
  end

  def print_bar(bar)

  end


  def print_bar(from_number)

  end

end