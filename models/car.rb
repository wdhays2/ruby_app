class Car
  attr_reader :id, :year, :model, :engine, :sale_price, :mpg_city, 
    :mpg_hwy, :maint_cost, :rpr_cost, :ins_cost, :grade_fuel, :years_to_keep

  # def initialize(year, model, engine, sale_price, mpg_city, 
  #   mpg_hwy, maint_cost, rpr_cost, ins_cost, grade_fuel, years_to_keep)
  def initialize(options)
    @id = options[:id]
    @year = options[:year]
    @model = options[:model]
    @engine = options[:engine]
    @sale_price = options[:sale_price]
    @mpg_city = options[:mpg_city]
    @mpg_hwy = options[:mpg_hwy]
    @maint_cost = options[:maint_cost]
    @rpr_cost = options[:rpr_cost]
    @ins_cost = options[:ins_cost]
    @grade_fuel = options[:grade_fuel]
    @regular = 2.79
    @mid_grade = 2.95
    @premium = 3.05
    @diesel = 2.85
    @annual_miles = 12000
    @years_to_keep = options[:years_to_keep]    
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

  def update_info(options)
    @year = options[:year]
    @model = options[:model]
    @engine = options[:engine]
    @sale_price = options[:sale_price]
    @mpg_city = options[:mpg_city]
    @mpg_hwy = options[:mpg_hwy]
    @maint_cost = options[:maint_cost]
    @rpr_cost = options[:rpr_cost]
    @ins_cost = options[:ins_cost]
    @grade_fuel = options[:grade_fuel]
    @annual_miles = options[:annual_miles]
    @years_to_keep = options[:years_to_keep] 
  end

  def to_a
    [@id, @year, @model, @engine, @sale_price, @mpg_city, 
    @mpg_hwy, @maint_cost, @rpr_cost, @ins_cost, @grade_fuel, @years_to_keep]
  end

  def to_s
    "#{year} #{model}: #{annual_cost_of_vehicle.round(0)}"
  end

  def to_hash
    {
      year: @year, model: @model, engine: @engine, sale_price: @sale_price, 
      mpg_city: @mpg_city, mpg_hwy: @mpg_hwy, maint_cost: @maint_cost, 
      rpr_cost: @rpr_cost, ins_cost: ins_cost, grade_fuel: @grade_fuel, 
      years_to_keep: @years_to_keep
    }
  end

end
  



# car = cars.detect { |c| c.model == 'F350' }
# car.maint_cost = 200

# maint_cars = cars.select { |c| c.model == 'Wrangler' }
# maint_cars.each { |c| c.maint_cost = 200.04 }

# cars.each { |c| c.maint_cost = 200.04 if c.model == 'Wrangler' }

# cars.each do |c|
#   if c.model == 'Wrangler'
#     c.maint_cost = 200.04
#   end
# end
