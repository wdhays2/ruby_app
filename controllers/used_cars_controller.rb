class UsedCarsController < BaseController
  @@cars = []
  @@car_results = []
  

  def self.load_cars
    @@cars = []
    @@car_results = []
    CSV.foreach('./data/cars.csv', {headers:true}) do |row|
      @@cars << Car.new(row.to_hash.symbolize_keys)
    end
    CSV.foreach('./data/search_results.csv', {headers:true}) do |row|
      @@car_results << Car.new(row.to_hash.symbolize_keys)
    end
  end
                      
  def self.save_cars
    CSV.open('./data/cars.csv', 'w') do |csv| 
      csv << [:id, :year, :model, :engine, :sale_price, :mpg_city, 
              :mpg_hwy, :maint_cost, :rpr_cost, :ins_cost, :grade_fuel, :years_to_keep]
      @@cars.each { |car| csv << car.to_a } 
    end
  end

  def self.save_car_results
    CSV.open('./data/search_results.csv', 'w') do |csv| 
      csv << [:id, :year, :model, :engine, :sale_price, :mpg_city, 
              :mpg_hwy, :maint_cost, :rpr_cost, :ins_cost, :grade_fuel, :years_to_keep]
      @@car_results.each { |car| csv << car.to_a }
    end
  end

  def self.create_car(car_info)
    new_id = _generate_new_id
    car = Car.new(car_info.merge({id: new_id}))
    @@cars << car
  end

  def self.update_car(car_id, car_info)
    pos = _find_car_array_index(car_id)
    @@cars[pos].update_info(car_info)
  end

  def self.delete_car(car_id)
    pos = _find_car_array_index(car_id)
    @@cars.delete_at(pos)
  end
  
  def self.clear_search
    @@car_results = []
    save_car_results
  end

  def self.search_cars(search_word, search_category)
    car_list = @@car_results.empty? ? @@cars : @@car_results
    search_word = search_word.to_i unless [2, 3, 10].include?(search_category.to_i)
    search_options = [:year, :model, :engine, :sale_price, :mpg_city, 
      :mpg_hwy, :maint_cost, :rpr_cost, :ins_cost, :grade_fuel, :years_to_keep]
    @@car_results = car_list.select do |car| 
      car.send(search_options[search_category.to_i - 1]) == search_word
    end
    save_car_results
  end

  def self.list
    car_list = @@car_results.empty? ? @@cars : @@car_results
    car_list.collect { |car| car.to_hash }
  end

  def self.show_car(car_id)
    pos = _find_car_array_index(car_id)
    car = @@cars[pos]
    show_all_car_details(car)
  end

  def self._generate_new_id
    return 1 if @@cars.size == 0 
    @@cars.last.id + 1
  end

  def self._find_car_array_index(car_id)
    @@cars.find_index { |car| car_id == car.id }
  end

  def self.annual_cost_of_cars
    cars = @@cars
    display_annual_cost_of_vehicles(cars)
  end

  def self.select_car(car_id)
    @@cars[_find_car_array_index(car_id)].to_hash
  end

  def self.is_a_number(input)
    begin
      Integer(input)
    rescue
      return false
    end
    return true
  end

end

