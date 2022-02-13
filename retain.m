function [case_library] = retain(case_library, new_case, journey_index)

    car = max(case_library{:, 1}) + 1;
    new_row = {car, new_case.symboling, new_case.normalized_losses, new_case.make, ...
                    new_case.fuel_type, new_case.aspiration, new_case.num_of_doors, ...
                    new_case.body_style, new_case.drive_wheels, new_case.engine_location, ...
                    new_case.wheel_base, new_case.length, new_case.width, new_case.height, ...
                    new_case.curb_weight, new_case.engine_type, new_case.num_of_cylinders, ...
                    new_case.engine_size, new_case.fuel_system,  new_case.bore, new_case.stroke, ...
                    new_case.compression_ratio, new_case.horsepower, new_case.peak_rpm, new_case.city_mpg, ...
                    new_case.highway_mpg, new_case.price};

    case_library = [case_library; new_row];
            
    fprintf('Adicionar a libraria de casos? (s/n)\n');
    option = input('Opcao: ', 's');
        
    %disp(new_case.price)
    
    if option == 's' || option == 'S'
        %new_case.price = new_price;
        writetable(case_library, 'cars.csv'); 
    end
end

