class Car
  attr_reader :id, :year, :model, :engine, :sale_price, :mpg_city, 
    :mpg_hwy, :maint_cost, :rpr_cost, :ins_cost, :grade_fuel, :years_to_keep

  # def initialize(year, model, engine, sale_price, mpg_city, 
  #   mpg_hwy, maint_cost, rpr_cost, ins_cost, grade_fuel, years_to_keep)
  def initialize(options)
    @id = options[:id].to_i
    @year = options[:year].to_i
    @model = options[:model].to_s
    @engine = options[:engine].to_s
    @sale_price = options[:sale_price].to_i
    @mpg_city = options[:mpg_city].to_i
    @mpg_hwy = options[:mpg_hwy].to_i
    @maint_cost = options[:maint_cost].to_i
    @rpr_cost = options[:rpr_cost].to_i
    @ins_cost = options[:ins_cost].to_i
    @grade_fuel = options[:grade_fuel].to_s
    @regular = 2.79
    @mid_grade = 2.95
    @premium = 3.05
    @diesel = 2.85
    @annual_miles = 12000
    @years_to_keep = options[:years_to_keep].to_i
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
    @year = options[:year].to_i
    @model = options[:model].to_s
    @engine = options[:engine].to_s
    @sale_price = options[:sale_price].to_i
    @mpg_city = options[:mpg_city].to_i
    @mpg_hwy = options[:mpg_hwy].to_i
    @maint_cost = options[:maint_cost].to_i
    @rpr_cost = options[:rpr_cost].to_i
    @ins_cost = options[:ins_cost].to_i
    @grade_fuel = options[:grade_fuel].to_i
    @annual_miles = options[:annual_miles].to_i
    @years_to_keep = options[:years_to_keep].to_i
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
      id: @id, year: @year, model: @model, engine: @engine, sale_price: @sale_price, 
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
