class UsedCarsController < BaseController
  @@cars = []
  @@car_results = []

  def load
    CSV.foreach('../data/cars.csv', {headers:true}) { |row| @@cars << Car.new(row.to_hash) }
  end
                      
  def save_car
    CSV.open('../data/cars.csv') { |csv| @@cars << csv.to_a }
  end 

  def create_car(car_info)
    new_id = _generate_new_id
    car = Car.new(car_info.merge({id: new_id}))
    @@cars << car
  end

  def update_car(car_id, car_info)
    pos = _find_car_array_index(car_id)
    @@cars[pos].update_info(car_info)
  end

  def delete_car(car_id)
    pos = _find_car_array_index(car_id)
    @@cars.delete_at(pos)
  end
  
  def search_cars(search_word)
    @@car_results = @@cars.collect { |car| car.model == search_word }
  end

  def show_car(car_id)
    pos = _find_car_array_index(car_id)
    return @@cars[pos]
  end

  def _generate_new_id
    return 1 if @@cars.size == 0 
    @@cars.last.id + 1
  end

  def _find_car_array_index(car_id)
    @@cars.find_index { |car| car_id == car.id }
  end

end

