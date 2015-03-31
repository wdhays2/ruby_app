def display_stock_info(stock)
  puts [
    ":: #{stock.ticker}",
    "  -- Open: #{stock.open}",
    "  -- High: #{stock.high}",
    "  -- Low: #{stock.low}",
    "  -- Close: #{stock.close}",
    "  -- Volumn: #{stock.volumn}",
    "  -- Net Change: #{stock.net_change}\n"].join("\n")
end

def display_github_repos(github)
  puts "#{github.username}, has the following repos: #{github.get_repo_list}"
end

def display_github_followers(github)
  puts "#{github.username}, has the following followers: #{github.get_followers}"
end

def display_github_following(github)
  puts "#{github.username}, is following the following users: #{github.get_following}"
end