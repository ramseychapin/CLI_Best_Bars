class CLIBestBars::CLI
  def call
    CLIBestBars::Scraper.new.make_bars
    puts ""
    puts "Welcome to your Best Bars concierge."
    puts "I am here to help you find which of the 50 best bars in the world you should frequent next."
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
    puts "What bar would you like to learn more about? Enter the rank number to continue."
    input = gets.strip.to_i

    if input.between?(1,50)
      bar = CLIBestBars::Bar.find(input)
      print_bar(bar)
    else
      puts "Sorry, that is not a valid number!"
      select_bar
    end
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

  def print_bar_list(from_number)
    anchor_number = 0
    case from_number
      when 1..10
        anchor_number
      when 11..20
        anchor_number = 10
      when 21..30
        anchor_number = 20
      when 31..40
        anchor_number = 30
      when 41..50
        anchor_number = 40
      else
        puts "That is not a valid number!"
        main
    end

    puts ""
    puts "---------- Bars #{anchor_number} - #{anchor_number+9} ----------"
    puts ""
    CLIBestBars::Bar.all[anchor_number..anchor_number+9].each do |bar|
      puts "#{bar.rank}. #{bar.name}"
    end

  end

  def print_bar(bar)
    puts ""
    puts "----------- #{bar.name}-----------"
    puts ""
    puts "Location:           #{bar.location}"
    puts "Website:            #{bar.website_url}"
    puts ""
    puts "---------------Description--------------"
    puts ""
    puts "#{bar.description}"
    puts ""
  end
end