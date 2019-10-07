class CLIBestBars::CLI
  def call
    CLIBestBars::Scraper.new.make_bars
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
    puts "What number bars would you like to see? 1-10, 11-20, 21-30, 31-40, or 41-50 What rank of bars would you like to see? Input a number 1-50 and I will show you the bar and its neighbors :)."
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


  def print_bar_list(from_number)
    case from_number
      when 1..10
        puts ""
        puts "---------- Bars #{1} - #{10} ----------"
        puts ""
        CLIBestBars::Bar.all[0..10].each do |bar|
          puts "#{bar.rank}. #{bar.name}"
        end
      when 11..20
        puts ""
        puts "---------- Bars #{11} - #{20} ----------"
        puts ""
        CLIBestBars::Bar.all[10..19].each do |bar|
          puts "#{bar.rank}. #{bar.name}"
        end
      when 21..30
        puts ""
        puts "---------- Bars #{21} - #{30} ----------"
        puts ""
        CLIBestBars::Bar.all[20..29].each do |bar|
          puts "#{bar.rank}. #{bar.name}"
        end
      when 31..40
        puts ""
        puts "---------- Bars #{31} - #{40} ----------"
        puts ""
        CLIBestBars::Bar.all[30..39].each do |bar|
          puts "#{bar.rank}. #{bar.name}"
        end
      when 41..50
        puts ""
        puts "---------- Bars #{41} - #{50} ----------"
        puts ""
        CLIBestBars::Bar.all[40..49].each do |bar|
          puts "#{bar.rank}. #{bar.name}"
        end
      else
        puts "That is not a valid number!"
        main
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