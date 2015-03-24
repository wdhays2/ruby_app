require 'rubygems'
require 'csv'
require 'open-uri'
require 'highline/import'
require 'rest_client'
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
      display_stock_info(stock)
    end

    menu.choice(:github) do
      username = ask('GitHub username?')
      github = GitHubUsersController.load_github_user_info(username)
      display_github_info(github)
    end

    menu.choices(:quit) { done = true }
  end
end
