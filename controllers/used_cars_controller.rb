class UsedCarsController < BaseController
  @@cars = []
  @@car_results = []

  def self.load_cars
    @@cars = []
    @@car_results = []
    CSV.foreach('./data/cars.csv', {headers:true}) do |row|
      @@cars << Car.new(row.to_hash.symbolize_keys)
    end
  end
                      
  def self.save_cars
    CSV.open('./data/cars.csv', 'w') do |csv| 
      csv << [:id, :year, :model, :engine, :sale_price, :mpg_city, 
              :mpg_hwy, :maint_cost, :rpr_cost, :ins_cost, :grade_fuel, :years_to_keep]
      @@cars.each { |car| csv << car.to_a } 
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
  end

  def self.search_cars(search_word)
    @@car_results = @@cars.select { |car| car.model == search_word }
  end

  def self.list
    car_list = @@car_results.empty? ? @@cars : @@car_results
    car_list.collect { |car| car.to_hash }
  end

  def self.show_car(car_id)
    pos = _find_car_array_index(car_id)
    return @@cars[pos]
  end

  def self._generate_new_id
    return 1 if @@cars.size == 0 
    @@cars.last.id + 1
  end

  def self._find_car_array_index(car_id)
    @@cars.find_index { |car| car_id == car.id }
  end

end

