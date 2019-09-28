class CLIBestBars::CLI
  def call
    #CLIBestBars::Scraper.new.make_bars
    puts "Welcome to your Best Bars concierge.
    I am here to help you find which of the 50 best bars in the world you should frequent next."
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

    bar = CLIBestBars::Bar.find(input.to_i)

    print_bar(bar)

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
    puts ""
    puts "----------- #{bar.name} - #{bar.position} -----------"
    puts ""
    puts "Location:           #{bar.location}"
    puts "Website:            #{bar.website_url}"
    puts ""
    puts "---------------Description--------------"
    puts ""
    puts "#{restaurant.description}"
    puts ""
  end


  def print_bar(from_number)
    puts ""
    puts "---------- Bars #{from_number} - #{from_number+9} ----------"
    puts ""
    CLIBestBars::Bar.all[from_number-1, 10].each.with_index(from_number) do |bar, index|
      puts "#{index}. #{bar.name} - #{bar.location}"
    end
  end

end