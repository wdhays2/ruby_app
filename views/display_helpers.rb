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

def display_github_info(github)
  puts github.to_s
end