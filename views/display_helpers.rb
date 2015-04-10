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
  puts "\n#{github.username}, has the following repos:\n#{format_array(github.get_repo_list)}"
end

def display_github_followers(github)
  puts "\n#{github.username}, has the following followers:\n#{format_array(github.get_followers)}"
end

def display_github_following(github)
  puts "\n#{github.username}, is following the following users:\n#{format_array(github.get_following)}"
end

def display_user_info(github)
  puts "\n#{format_hash(github.get_user_info)}"
end

def display_annual_cost_of_vehicles(cars)
  cars.sort{|x, y| x.model <=> y.model}.each { |c| puts c.to_s }
end

def format_hash(user)
  puts [
  "  -- #{user[:name]}",
  "  -- #{user[:company]}",
  "  -- #{user[:blog]}",
  "  -- #{user[:location]}",
  "  -- #{user[:email]}",
  "  -- Hireable: #{user[:hireable] ? 'YES' : 'NO' }",
  "  -- Bio: #{user[:bio] || 'NOT SET'}"].join("\n")
end

def format_array(arr)
  arr.collect { |i| "  -- #{i}" }.sort_by{ |a| a.downcase }.join("\n")
end

def display_cars(cars)
  cars.each { |car| puts "--  " + [car[:id], car[:model]].join(' :: ') }
end

def show_all_car_details(car)
  puts "  --  Car id: #{car.id}\n
  --  Year: #{car.year}\n
  --  Model: #{car.model}\n
  --  Engine: #{car.engine}\n
  --  Sale Price: $ #{car.sale_price}\n 
  --  City MPG: #{car.mpg_city}\n
  --  Hwy MPG: #{car.mpg_hwy}\n
  --  Maint. Cost: #{car.maint_cost}\n
  --  Est. Repair Cost: #{car.rpr_cost}\n
  --  Insurance Cost #{car.ins_cost}\n
  --  Grade Fuel: #{car.grade_fuel}\n
  --  Years to Keep: #{car.years_to_keep}" 
end
