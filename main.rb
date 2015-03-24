require 'rubygems'
require 'csv'
require 'uri'
require 'open-uri'
require 'highline/import'
require 'pry'

# Include files in folders
Dir[File.dirname(__FILE__) + '/models/*.rb'].each { |f| require(f) }
Dir[File.dirname(__FILE__) + '/controllers/*.rb'].each { |f| require(f) }
Dir[File.dirname(__FILE__) + '/views/*.rb'].each { |f| require(f) }

done = false
while !done do
  choose do |menu|
    menu.prompt = 'Choose option:'
    menu.choice(:stock) do
      ticker = ask('Ticker?')
      stock = StocksController.load_ticker(ticker)
      display_stock(stock)
    end
    menu.choices(:quit) { done = true }
  end
end
