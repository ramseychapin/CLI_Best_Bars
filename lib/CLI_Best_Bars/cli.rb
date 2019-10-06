class CLIBestBars::CLI
  def call
    #CLIBestBars::Scraper.new.make_bars
    puts "Welcome to your Best Bars concierge.
    I am here to help you find which of the 50 best bars in the world you should frequent next."
    main
  end

  def main
    bar_list
    select_bar
    conclude
  end

  def bar_list
    puts ""
    puts "What number bars would you like to see? 1-10, 11-20, 21-30, 31-40, or 41-50?"
    input = gets.strip.to_i

    print_bar_list(input)
  end

  def select_bar
    puts ""
    puts "What bar would you like to learn more about?"
    input = gets.strip

    bar = CLIBestBars::Bar.find(input.to_i)

    print_bar(bar)
  end

  def conclude
    puts ""
    puts "Would you like to learn about another bar? Enter Y or N"


    input = gets.strip.downcase
    if input == "y"
      main
    elsif input == "n"
      puts ""
      puts "Go enjoy some cocktails!"
      exit
    else
      puts ""
      puts "I don't understand that answer. Please respond Y or N."
      conclude
    end
  end


  # def print_bar_list(from_number)
  #   puts ""
  #   puts "---------- Bars #{from_number} - #{from_number+9} ----------"
  #   puts ""
  #   CLIBestBars::Bar.all[from_number-1, 10].each.with_index(from_number) do |bar, index|
  #     puts "#{index}. #{bar.name} - #{bar.location}"
  #   end
  # end

  def print_bar_list(from_number)
    puts ""
    puts "---------- Bars 1 - 9 ----------"
    puts ""
  end

  # def print_bar(bar)
  #   puts ""
  #   puts "----------- #{bar.name} - #{bar.position} -----------"
  #   puts ""
  #   puts "Location:           #{bar.location}"
  #   puts "Website:            #{bar.website_url}"
  #   puts ""
  #   puts "---------------Description--------------"
  #   puts ""
  #   puts "#{bar.description}"
  #   puts ""
  # end

  def print_bar(bar)
    puts ""
    puts "----------- Dead Rabbit - New York -----------"
    puts ""
    puts "Location:           New York"
    puts "Website:            www.deadrabbit.com"
    puts ""
    puts "---------------Description--------------"
    puts ""
    puts "supposed best bar in the city"
    puts ""
  end
end