def car_menu_options
    task_to_perform = ask("What would you like to do today?\n
        --  1) Enter a new car\n
        --  2) Update an existing car\n
        --  3) Show a list of cars\n
        --  4) Delete a car\n
        --  5) Search for a car\n
        --  6) Show all info for a particular car\n 
        --  7) Compare annual cost to operate all cars\n
        --  8) Exit")
        case task_to_perform.to_i
        when 1 then create_new_car
        when 2 then car_id = ask("Which vehicle ID?")
            what_to_update(car_id)
        when 3 then display_car_list
        when 4 then car_id = ask("Which vehicle ID?")
            delete_car_from_list(car_id)
        when 5 then search_cars
        when 6 then car_id = ask("Which vehicle ID?")
            show_all_car_info(car_id)
        when 7 then display_annual_cost
        when 8 then exit
    end
end

def create_new_car
    new_car = {}
    new_car.year.to_i = ask("What is the year?")
    new_car.model = ask("What model is the car?")
    new_car.engine = ask("Which engine does it have?")
    new_car.sale_price.to_i = ask("What is the purchase price?")
    new_car.mpg_city.to_i = ask("How many MPG does it get in the city?")
    new_car.mpg_hwy.to_i = ask("How many MPG does it get on the highway?")
    new_car.maint_cost.to_i = ask("How much will normal maintenance cost per year?")
    new_car.rpr_cost.to_i = ask("What is the estimated repair cost per year?")
    new_car.ins_cost.to_i = ask("How much will insurance cost per year?")
    fuel_answer = ask("Does the car take?\n 
        --  1) Regular Unleaded\n
        --  2) Mid-grade\n
        --  3) Premium\n
        --  4) Diesel")
        case fuel_answer.to_i
        when 1 then new_car.grade_fuel = "regular"
        when 2 then new_car.grade_fuel = "mid_grade"
        when 3 then new_car.grade_fuel = "premium"
        when 4 then new_car.grade_fuel = "diesel"
    end
    new_car.years_to_keep = ask("How many years do you plan to keep the car?")
    create_car(new_car)
    more = ask("Add another vehicle?\n
        --  1) Yes\n
        --  2) No")
        case more.to_i
        when 1 then create_new_car
        when 2 then car_menu_options
    end
end

def what_to_update(car_id)
    car_id = car_id
    make_change_to = ask("What would you like to update?\n
        --  1) year\n
        --  2) model\n
        --  3) engine\n
        --  4) sale_price\n
        --  5) mpg_city\n
        --  6) mpg_hwy\n
        --  7) maint_cost\n
        --  8) rpr_cost\n
        --  9) ins_cost\n
        --  10) grade_fuel\n
        --  11) years_to_keep\n
        --  12) exit")
        case make_change_to.to_i
        when 1 then @@cars[car_id].year.to_i = ("What is the year?")
        when 2 then @@cars[car_id].model = ask("What model is the car?")
        when 3 then @@cars[car_id].engine = ask("Which engine does it have?")
        when 4 then @@cars[car_id].sale_price.to_i = ask("What is the purchase price?")
        when 5 then @@cars[car_id].mpg_city.to_i = ask("How many MPG does it get in the city?")
        when 6 then @@cars[car_id].mpg_hwy.to_i = ask("How many MPG does it get on the highway?")
        when 7 then @@cars[car_id].maint_cost.to_i = ask("How much will normal maintenance cost per year?")
        when 8 then @@cars[car_id].rpr_cost.to_i = ask("What is the estimated repair cost per year?")
        when 9 then @@cars[car_id].ins_cost.to_i = ask("How much will insurance cost per year?")
        when 10 then fuel_answer = ask("Does the car take?\n 
            --  1) Regular Unleaded\n
            --  2) Mid-grade\n
            --  3) Premium\n
            --  4) Diesel")
            case fuel_answer.to_i
            when 1 then @@cars[car_id].grade_fuel = "regular"
            when 2 then @@cars[car_id].grade_fuel = "mid_grade"
            when 3 then @@cars[car_id].grade_fuel = "premium"
            when 4 then @@cars[car_id].grade_fuel = "diesel"
        end
        when 11 then @@car[car_id].years_to_keep = ask("How many years do you plan to keep the car?")
        when 12 then car_menu_options
    end
    more = ask("Do you need to make more changes to this vehicle?\n
        --  1) Yes\n
        --  2) No")
        case more.to_i
        when 1 then what_to_update(car_id)
        when 2 then car_menu_options
    end    
end

def display_car_list
    puts display_cars
end

def delete_car_from_list(car_id)
    UsedCarsController.delete_car(car_id)
end

def search_cars
    search_word = ask ("Which vehicle are you looking for?")
    cars.each { |car| car.has_value? search_word }
    puts car
end

def show_all_car_info(car_id)
    puts UsedCarsController.show_car(car_id)
end

def display_annual_cost
    puts UsedCarsController.display_annual_cost_of_vehicles
end