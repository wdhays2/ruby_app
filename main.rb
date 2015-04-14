require 'rubygems'
require 'csv'
require 'open-uri'
require 'highline/import'
require 'rest_client'
require 'json'
require 'active_support/all'
#require 'pry'

# Include files in folders
Dir[File.dirname(__FILE__) + '/models/*.rb'].each { |f| require(f) }
Dir[File.dirname(__FILE__) + '/controllers/*.rb'].each { |f| require(f) }
Dir[File.dirname(__FILE__) + '/views/*.rb'].each { |f| require(f) }


UsedCarsController.load_cars

last_username = nil
username = ""
done = false
while !done do
  choose do |menu|
    menu.prompt = 'Choose option:'

    menu.choice(:cars) do
      cmo_val_done = false
      while !cmo_val_done do 
        cmo_val_done = car_menu_options
      end
    end


    menu.choice(:stock) do
      ticker = ask('Ticker?')
      stock = StocksController.load_ticker(ticker)
      display_stock_info(stock)
    end

    menu.choice(:github) do
      if last_username.nil? 
        username = ''       
        while username == ""
          username = ask('GitHub username?')
        end
      else
        username = ask("GitHub username (#{last_username})?")
        username = last_username if username == "" 
      end           
      last_username = username


      github = GitHubUsersController.load_github_user_info(username)
      if github.valid_username?
        what_to_look_at = ask("Display: 1) Repos, 2) Followers, 3) Following, 4) User Info")        
        case what_to_look_at.to_i
        when 1 then display_github_repos(github)
        when 2 then display_github_followers(github)
        when 3 then display_github_following(github)
        when 4 then display_user_info(github)
        end
      else
        puts "Username invalid."
        last_username = nil
      end
    end

    menu.choices(:quit) { done = true }
  end
end
