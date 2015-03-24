def display_stock(stock)
  puts [
    ":: #{stock.ticker}",
    "  -- Open: #{stock.open}",
    "  -- High: #{stock.high}",
    "  -- Low: #{stock.low}",
    "  -- Close: #{stock.close}",
    "  -- Volumn: #{stock.volumn}",
    "  -- Net Change: #{stock.volumn}\n"].join("\n")
end
