function [car, new_case] = revise(retrieved_cases, new_case, new_price)
    
    make = {'alfa-romero','audi','bmw','chevrolet','dodge','honda','isuzu','jaguar','mazda','mercedes-benz','mercury','mitsubishi','nissan','peugot','plymouth','porsche','renault','saab','subaru','toyota','volkswagen','volvo'};
    body_style = {'hardtop', 'wagon', 'sedan', 'hatchback', 'convertible'};
    drive_wheels = {'4wd', 'fwd,' 'rwd'};
    fuel = {'diesel', 'gas'};
    aspiration_tipos = {'std', 'turbo'};
    num_Of_Doors = {'four', 'two'};
    engine_Location = {'front', 'rear'};
    fuel_system = {'1bbl', '2bbl', '4bbl', 'idi', 'mfi', 'mpfi', 'spdi', 'spfi'};
    engine_tipos = {'dohc', 'dohcv', 'l', 'ohc', 'ohcf', 'ohcv', 'rotor'};
    num_Of_Cylinders = {'eight', 'five', 'four', 'six', 'three', 'twelve', 'two'};



    retrieved_codes = retrieved_cases{:,1};
    codigo = str2double('-');
    
    car = fix(codigo);
    n = -1;
    while n ~= 0
        n = input('Escolhe o parametro para Atualizar:\n1 - symboling\n2 - normalized_losses\n3 - make\n4 - fuel_type\n5 - aspiration\n6 - num_of_doors\n7 - body_style\n8 - drive_wheels\n9 - engine_location\n10 - wheel_base\n11 - length\n12 - width\n13 - height\n14 - curb_weight\n15 - engine_type\n16 - num_of_cylinders\n17 - engine_size\n18 - fuel_system\n19 - bore\n20 - stroke\n21 - compression_ratio\n22 - horsepower\n23 - peak_rpm\n24 - city_mpg\n25 - highway_mpg\n26 - price\n27 - Continuar\n Escolha: ');

        switch n
            case 1 
                symboling = str2double(input('Symboling: ','s'));
                while (symboling < -3) || (symboling >3)
                    symboling = str2double(input('Symboling: ','s'));
                end
                new_case.symboling = symboling;
                
            case 2 
                normalizedLosses = str2double(input('Normalized Losses: ','s'));
                while (normalizedLosses < 65) || (normalizedLosses > 256)
                    normalizedLosses = str2double(input('Normalized Losses: ','s'));
                end
                new_case.normalized_losses = normalizedLosses;
                
            case 3 
                marca = input('Marca do carro: ','s');
                while ~any(strcmp(make, marca))
                    marca = input('Marca do carro: ','s');
                end
                new_case.make = marca;
                
            case 4 
                fuel_gas = input('Fuel type: ','s');
                while ~any(strcmp(fuel,fuel_gas))
                    fuel_gas = input('Fuel type: ','s');
                end
                new_case.fuel_type = fuel_gas;
                
            case 5 
                aspiration = input('Aspiration: ','s');
                while ~any(strcmp(aspiration_tipos, aspiration))
                    aspiration = input('Aspiration: ','s');
                end
                new_case.aspiration = aspiration;
                
            case 6 
                doors = input('Number of doors: ','s');
                while ~any(strcmp(num_Of_Doors,doors))
                    doors = input('Number of doors: ','s');
                end
                new_case.num_of_doors = doors;
                
            case 7 
                bodyStyle = input('Body Style: ','s');
                while ~any(strcmp(body_style,bodyStyle))
                    bodyStyle = input('Body Style: ','s');
                end
                new_case.body_style = bodyStyle;
                
            case 8 
                driveWheels = input('Drive Wheels: ','s');
                while ~any(strcmp(drive_wheels,driveWheels))
                    driveWheels = input('Drive Wheels: ','s');
                end
                new_case.drive_wheels = driveWheels;
                
            case 9 
                engineLocation = input('Engine Location: ','s');
                while ~any(strcmp(engine_Location, engineLocation))
                    engineLocation = input('Engine Location: ','s');
                end
                new_case.engine_location = engineLocation;
                
            case 10 
                wheelBase = str2double(input('Wheel Base: ','s'));
                while (wheelBase < 86.6) || (wheelBase > 120.9)
                    wheelBase = str2double(input('Wheel Base: ','s'));
                end
                new_case.wheel_base = wheelBase;
                
            case 11 
                length = str2double(input('Length: ','s'));
                while (length < 141.1) || (length > 208.1)
                    length = str2double(input('Length: ','s'));
                end
                new_case.length = length;
                
            case 12 
                width = str2double(input('Width: ','s'));
                while (width < 60.3) || (width > 72.3)
                    width = str2double(input('Width: ','s'));
                end
                new_case.width = width;
                
            case 13 
                height = str2double(input('Height: ','s'));
                while (height < 47.8) || (height > 59.8)
                    height = str2double(input('Height: ','s'));
                end
                new_case.height = height;
                
            case 14 
                curbWeight = str2double(input('Curb Weight: ','s'));
                while (curbWeight < 1488) || (curbWeight > 4066)
                    curbWeight = str2double(input('Curb Weight: ','s'));
                end
                new_case.curb_weight = curbWeight;
                
            case 15 
                engineType = input('Engine Type: ','s');
                while ~any(strcmp(engine_tipos, engineType))
                    engineType = input('Engine Type: ','s');
                end
                new_case.engine_type = engineType;
                
            case 16 
                cylinders = input('Numbers of Cylinders: ','s');
                while ~any(strcmp(num_Of_Cylinders, cylinders))
                    cylinders = input('Numbers of Cylinders: ','s');
                end
                new_case.num_of_cylinders = cylinders;
                
            case 17 
                engineSize = str2double(input('Engine Size: ','s'));
                while (engineSize < 61) || (engineSize > 326) 
                    engineSize = str2double(input('Engine Size: ','s'));
                end
                new_case.engine_size = engineSize;
                
            case 18 
                fuelSystem = input('Fuel System: ','s');
                while ~any(strcmp(fuel_system, fuelSystem))
                    fuelSystem = input('Fuel System: ','s');
                end
                new_case.fuel_system = fuelSystem;
                
            case 19 
                bore = str2double(input('Bore: ','s'));
                while (bore < 2.54) || (bore > 3.94)
                    bore = str2double(input('Bore: ','s'));
                end
                new_case.bore = bore;
                
            case 20 
                stroke = str2double(input('Stroke: ','s'));
                while (stroke < 2.07) || (stroke > 4.17)
                    stroke = str2double(input('Stroke: ','s'));
                end
                new_case.stroke = stroke;
                
            case 21 
                compressionRatio = str2double(input('Compression Ratio: ','s'));
                while (compressionRatio < 7) || (compressionRatio > 23)
                    compressionRatio = str2double(input('Compression Ratio: ','s'));
                end
                new_case.compression_ratio = compressionRatio;
                
            case 22 
                horsePower = str2double(input('Horse Power: ','s'));
                while (horsePower < 48) || (horsePower > 288)
                    horsePower = str2double(input('Horse Power: ','s'));
                end
                new_case.horsepower = horsePower;
                
            case 23 
                peakRPM = str2double(input('Peak RPM: ','s'));
                while (peakRPM < 4150) || (peakRPM > 6600)
                    peakRPM = str2double(input('Peak RPM: ','s'));
                end
                new_case.peak_rpm = peakRPM;
                
            case 24 
                cityMPG = str2double(input('City MPG: ','s'));
                while (cityMPG < 13) || (cityMPG > 49)
                    cityMPG = str2double(input('City MPG: ','s'));
                end
                new_case.city_mpg = cityMPG;
                
            case 25 
                highwayMPG = str2double(input('Highway MPG: ','s'));
                while (highwayMPG < 16) || (highwayMPG > 54)
                    highwayMPG = str2double(input('Highway MPG: ','s'));
                end
                new_case.highway_mpg = highwayMPG;
                
            case 26 
                price = str2double(input('Price: ', 's'));
                while (price < 5118) || (price > 45400)
                    price = str2double(input('Price: ', 's'));
                end
                new_case.price = price
                
            case 27
                disp(new_case)
                break
        end
    end
end

