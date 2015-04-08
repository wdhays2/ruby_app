class UsedCarsController < BaseController
  @@cars = []
  @@car_results = []
  def self.load_cars
    [
      Car.new({
        id: 1, year: 2011, model: "Camry", engine: "Hybrid", sale_price: 15000, 
        mpg_city: 31, mpg_hwy: 35, maint_cost: 300, rpr_cost: 0, ins_cost: 600, 
        grade_fuel: "regular", years_to_keep: 3}),
      Car.new({
        id: 2, year: 2006, model: "F350", engine: "6.0 liter", sale_price: 24000, 
        mpg_city: 16, mpg_hwy: 20, maint_cost: 1000, rpr_cost: 1200, ins_cost: 600, 
        grade_fuel: "diesel", years_to_keep: 10}),
      Car.new({
        id: 3, year: 1993, model: "Wrangler", engine: "4.0 liter", sale_price: 6000, 
        mpg_city: 16, mpg_hwy: 20, maint_cost: 350, rpr_cost: 2000, ins_cost: 600, 
        grade_fuel: "mid_grade", years_to_keep: 3}),
      Car.new({
        id: 4, year: 2003, model: "Wrangler", engine: "4.0 liter", sale_price: 12000, 
        mpg_city: 16, mpg_hwy: 19, maint_cost: 500, rpr_cost: 500, ins_cost: 600, 
        grade_fuel: "mid_grade", years_to_keep: 3}),
      Car.new({
        id: 5, year: 2010, model: "Fusion", engine: "Hybrid", sale_price: 17000, 
        mpg_city: 41, mpg_hwy: 36, maint_cost: 300, rpr_cost: 0, ins_cost: 600, 
        grade_fuel: "regular", years_to_keep: 3}),
      Car.new({
        id: 6, year: 2009, model: "Jetta", engine: "2.0 liter", sale_price: 15000, 
        mpg_city: 29, mpg_hwy: 40, maint_cost: 300, rpr_cost: 0, ins_cost: 600, 
        grade_fuel: "diesel", years_to_keep: 3}),
      Car.new({
        id: 7, year: 2011, model: "Mustang", engine: "3.7 liter", sale_price: 17000, 
        mpg_city: 19, mpg_hwy: 29, maint_cost: 350, rpr_cost: 0, ins_cost: 700, 
        grade_fuel: "premium", years_to_keep: 3}),
      Car.new({
        id: 8, year: 2001, model: "F150", engine: "5.4 liter", sale_price: 11000, 
        mpg_city: 17, mpg_hwy: 20, maint_cost: 500, rpr_cost: 500, ins_cost: 600, 
        grade_fuel: "regular", years_to_keep: 3}),
      Car.new({
        id: 9, year: 1999, model: "G Cherokee", engine: "4.0 liter", sale_price: 4500, 
        mpg_city: 16, mpg_hwy: 21, maint_cost: 300, rpr_cost: 300, ins_cost: 600, 
        grade_fuel: "mid_grade", years_to_keep: 3})
      ]
  end
                      #needs to be checked -not sure why we need save _car
                      #doesn't create and update save? 
                      def save_car(car_id)
                        car = car
                        @@cars << car
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
                      # needs to be checked
                      def search_cars(search_word)
                        @@cars { |car| search_word == car.has_value? }
                        return @@cars.show_car(car.id)
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

