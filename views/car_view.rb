def car_menu_options
    task_to_perform = ask("What would you like to do today?\n
        --  1) Enter a new car\n
        --  2) Update an existing car\n
        --  3) Show a list of cars\n
        --  4) Delete a car\n
        --  5) Search for a car\n
        --  6) Clear search results (Show all cars)\n
        --  7) Show all info for a particular car\n 
        --  8) Compare annual cost to operate all cars\n
        --  9) Exit")
        case task_to_perform.to_i
        when 1 then create_new_car
        when 2 
            display_car_list
            car_id = ask('Which vehicle ID?') 
            what_to_update(car_id.to_i)
        when 3
            display_car_list
            car_menu_options
        when 4 
            display_car_list
            car_id = ask('Which vehicle ID?')
            delete_car_from_list(car_id.to_i)
        when 5 then display_search_results
        when 6 then clear_search_results
        when 7 
            display_car_list
            car_id = ask('Which vehicle ID?')
            show_all_car_info(car_id.to_i)
        when 8 then display_annual_cost
        when 9 
            save = ask('Do want to save your changes? y or n')
            case save
            when 'y' 
                save_changes
                exit
            when 'n' then exit
        end
    end
end

def create_new_car
    new_car = {}
    new_car[:year] = ask("What is the year?")
    new_car[:model] = ask("What model is the car?")
    new_car[:engine] = ask("Which engine does it have?")
    new_car[:sale_price] = ask("What is the purchase price?")
    new_car[:mpg_city] = ask("How many MPG does it get in the city?")
    new_car[:mpg_hwy] = ask("How many MPG does it get on the highway?")
    new_car[:maint_cost] = ask("How much will normal maintenance cost per year?")
    new_car[:rpr_cost] = ask("What is the estimated repair cost per year?")
    new_car[:ins_cost] = ask("How much will insurance cost per year?")
    fuel_answer = ask("Does the car take?\n 
        --  1) Regular Unleaded\n
        --  2) Mid-grade\n
        --  3) Premium\n
        --  4) Diesel")
        case fuel_answer.to_i
        when 1 then new_car[:grade_fuel] = 'regular'
        when 2 then new_car[:grade_fuel] = "mid_grade"
        when 3 then new_car[:grade_fuel] = "premium"
        when 4 then new_car[:grade_fuel] = "diesel"
    end
    new_car[:years_to_keep] = ask('How many years do you plan to keep the car?')
    UsedCarsController.create_car(new_car)
    more = ask("Add another vehicle?\n
        --  1) Yes\n
        --  2) No")
        case more.to_i
        when 1 then create_new_car
        when 2 then car_menu_options
    end
end

def what_to_update(car_id)
    car = UsedCarsController.select_car(car_id)
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
        when 1 then car[:year] = ask("What is the year? (#{car[:year]})")
        when 2 then car[:model] = ask("What model is the car? (#{car[:model]})")
        when 3 then car[:engine] = ask("Which engine does it have? (#{car[:engine]})")
        when 4 then car[:sale_price] = ask("What is the purchase price? (#{car[:sale_price]})")
        when 5 then car[:mpg_city] = ask("How many MPG does it get in the city? (#{car[:mpg_city]})")
        when 6 then car[:mpg_hwy] = ask("How many MPG does it get on the highway? (#{car[:mpg_hwy]})")
        when 7 then car[:maint_cost] = ask("How much will normal maintenance cost per year? (#{car[:maint_cost]})")
        when 8 then car[:rpr_cost] = ask("What is the estimated repair cost per year? (#{car[:rpr_cost]})")
        when 9 then car[:ins_cost] = ask("How much will insurance cost per year? (#{car[:ins_cost]})")
        when 10 
            fuel_answer = ask("Does the car take?\n 
            --  1) Regular Unleaded\n
            --  2) Mid-grade\n
            --  3) Premium\n
            --  4) Diesel")
            case fuel_answer.to_i
            when 1 then car[:grade_fuel] = 'regular'
            when 2 then car[:grade_fuel] = 'mid_grade'
            when 3 then car[:grade_fuel] = 'premium'
            when 4 then car[:grade_fuel] = 'diesel'
        end
        when 11 then car[:years_to_keep] = ask("How many years do you plan to keep the car? (#{car[:years_to_keep]})")
        when 12 then car_menu_options
    end
    UsedCarsController.update_car(car_id, car)
    more = ask("Do you need to make more changes to this vehicle?\n
        --  1) Yes\n
        --  2) No")
        case more.to_i
        when 1 then what_to_update(car_id)
        when 2 then car_menu_options
    end    
end

def display_car_list
    cars = UsedCarsController.list
    display_cars(cars)
end

def delete_car_from_list(car_id)
    UsedCarsController.delete_car(car_id)
    car_menu_options
end

def display_search_results
    search_word = ask('Which vehicle are you looking for?')    
    UsedCarsController.search_cars(search_word)
    display_car_list
    car_menu_options
end

def show_all_car_info(car_id)
    puts UsedCarsController.show_car(car_id)
    car_menu_options
end

def display_annual_cost
    UsedCarsController.annual_cost_of_cars
    car_menu_options
end

def save_changes
    UsedCarsController.save_cars
end 

def clear_search_results
    UsedCarsController.clear_search
    car_menu_options
end