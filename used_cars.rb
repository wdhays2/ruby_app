class Car
  attr_reader :year, :model, :engine, :sale_price, :mpg_city, 
    :mpg_hwy, :maint_cost, :rpr_cost, :ins_cost, :grade_fuel
  def initialize(year, model, engine, sale_price, mpg_city, 
    mpg_hwy, maint_cost, rpr_cost, ins_cost, grade_fuel)
    @year = year
    @model = model
    @engine = engine
    @sale_price = sale_price
    @mpg_city = mpg_city
    @mpg_hwy = mpg_hwy
    @maint_cost = maint_cost
    @rpr_cost = rpr_cost
    @ins_cost = ins_cost
    @grade_fuel = grade_fuel
    @regular = 2.79
    @mid_grade = 2.95
    @premium = 3.05
    @diesel = 2.85
    @annual_miles = 12000
    @years_to_keep = 3
    @years_to_keep_truck = 10
  end
  def avg_mpg
    (@mpg_city * 2 + @mpg_hwy) / 3
  end
  def annual_fuel_price
    @annual_miles / @avg_mpg * @grade_fuel
  end
  def annual_cost_of_vehicle
    (@sale_price.to_f / @years_to_keep.to_f) + @annual_fuel_price.to_f +
     @maint_cost.to_f + @rpr_cost.to_f + @ins_cost.to_f
  end
  def annual_cost_of_truck
    (@sale_price.to_f / @years_to_keep_truck.to_f) + @annual_fuel_price.to_f +
     @maint_cost.to_f + @rpr_cost.to_f + @ins_cost.to_f
  end
end
camry_2011_hybrid = Car.new(2011, "Camry", "Hybrid", 15000, 31, 35, 300, 0, 600, "regular")
f350_2006_6_0 = Car.new(2006, "F350", "6.0 liter", 24000, 16, 20, 1000, 450, 600, "diesel")
wrangler_1993_4_0 = Car.new(1993, "Wrangler", "4.0 liter", 6000, 16, 20, 350, 2000, 600, "mid_grade")
wrangler_2003_4_0 = Car.new(2003, "Wrangler", "4.0 liter", 12000, 16, 19, 500, 500, 600, "mid_grade")
fusion_2010_hybrid = Car.new(2010, "Fusion", "Hybrid", 17000, 41, 36, 300, 0, 600, "regular")
jetta_2009_2_0 = Car.new(2009, "Jetta", "2.0 liter", 15000, 29, 40, 300, 0, 600, "diesel")
mustang_2011_3_7 = Car.new(2011, "Mustang", "3.7 liter", 17000, 19, 29, 350, 0, 700, "premium")
f150_2001_5_4 = Car.new(2001, "F150", "5.4 liter", 11000, 17, 20, 500, 500, 600, "regular")

puts "  -- Camry: #{camry_2011_hybrid.annual_cost_of_vehicle.round(0)}"
puts "  -- F350: #{f350_2006_6_0.annual_cost_of_truck.round(0)}"
puts "  -- F150: #{f150_2001_5_4.annual_cost_of_vehicle.round(0)}"
puts "  -- Fusion: #{fusion_2010_hybrid.annual_cost_of_vehicle.round(0)}"
puts "  -- Jetta: #{jetta_2009_2_0.annual_cost_of_vehicle.round(0)}"
puts "  -- Mustang: #{mustang_2011_3_7.annual_cost_of_vehicle.round(0)}"
puts "  -- 93 Jeep: #{wrangler_1993_4_0.annual_cost_of_vehicle.round(0)}"
puts "  -- 03 Jeep: #{wrangler_2003_4_0.annual_cost_of_vehicle.round(0)}"