require 'rubygems'
require 'csv'
require 'open-uri'
require 'highline/import'
require 'rest_client'
require 'json'
#require 'pry'

# Include files in folders
Dir[File.dirname(__FILE__) + '/models/*.rb'].each { |f| require(f) }
Dir[File.dirname(__FILE__) + '/controllers/*.rb'].each { |f| require(f) }
Dir[File.dirname(__FILE__) + '/views/*.rb'].each { |f| require(f) }

last_username = nil
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
      if last_username.nil?
        username = ask('GitHub username?')
      else
        username = ask("GitHub username (#{last_username})?")
      end
      username = last_username if username.nil?
      
      last_username = username

      what_to_look_at = ask("Display: 1) Repos, 2) Followers, 3) Following, 4) User Info")
      github = GitHubUsersController.load_github_user_info(username)
      case what_to_look_at.to_i
      when 1 then display_github_repos(github)
      when 2 then display_github_followers(github)
      when 3 then display_github_following(github)
      when 4 then display_user_info(github)
      end
    end

    menu.choices(:quit) { done = true }
  end
end
