require_relative "./CLI_Best_Bars/version"
require_relative "./CLI_Best_Bars/cli"
require_relative "./CLI_Best_Bars/scraper"
require_relative "./CLI_Best_Bars/bar"

require 'pry'
require 'nokogiri'
require 'open-uri'

module CLIBestBars
  class Error < StandardError; end
  # Your code goes here...
end
