function [] = cbr(fy, weighting_factors, apresenta_x)
    
    %fprintf('valores apresentar');
    %disp(apresenta_x)

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
    
    similarity_threshold = 0.85;
    
    
    
    formatSpec = '%f%f%f%C%C%C%C%C%C%C%f%f%f%f%f%C%C%f%C%f%f%f%f%f%f%f%f';

    case_library = readtable('cars.csv', ...
        'Delimiter', ',', ...
        'Format', formatSpec);
    %abrir ficheiro para obter valores
    
    %valores para meu carro .. falta interface para obeter valores


    symboling = str2double(input('Symboling: ','s'));
    while (symboling < -3) || (symboling >3)
    symboling = str2double(input('Symboling: ','s'));
    end
    new_case.symboling = symboling;
    
    normalizedLosses = str2double(input('Normalized Losses: ','s'));
    while (normalizedLosses < 65) || (normalizedLosses > 256)
    normalizedLosses = str2double(input('Normalized Losses: ','s'));
    end
    new_case.normalized_losses = normalizedLosses;
    
    marca = input('Marca do carro: ','s');
    while ~any(strcmp(make, marca))
    marca = input('Marca do carro: ','s');
    end
    new_case.make = marca;
    
    fuel_gas = input('Fuel type: ','s');
    while ~any(strcmp(fuel,fuel_gas))
    fuel_gas = input('Fuel type: ','s');
    end
    new_case.fuel_type = fuel_gas;
    
    aspiration = input('Aspiration: ','s');
    while ~any(strcmp(aspiration_tipos, aspiration))
    aspiration = input('Aspiration: ','s');
    end
    new_case.aspiration = aspiration;
    
    doors = input('Number of doors: ','s');
    while ~any(strcmp(num_Of_Doors,doors))
    doors = input('Number of doors: ','s');
    end
    new_case.num_of_doors = doors;
    
    bodyStyle = input('Body Style: ','s');
    while ~any(strcmp(body_style,bodyStyle))
    bodyStyle = input('Body Style: ','s');
    end
    new_case.body_style = bodyStyle;
    
    driveWheels = input('Drive Wheels: ','s');
    while ~any(strcmp(drive_wheels,driveWheels))
    driveWheels = input('Drive Wheels: ','s');
    end
    new_case.drive_wheels = driveWheels;
    
    engineLocation = input('Engine Location: ','s');
    while ~any(strcmp(engine_Location, engineLocation))
    engineLocation = input('Engine Location: ','s');
    end
    new_case.engine_location = engineLocation;
    
    wheelBase = str2double(input('Wheel Base: ','s'));
    while (wheelBase < 86.6) || (wheelBase > 120.9)
    wheelBase = str2double(input('Wheel Base: ','s'));
    end
    new_case.wheel_base = wheelBase;
    
    length = str2double(input('Length: ','s'));
    while (length < 141.1) || (length > 208.1)
    length = str2double(input('Length: ','s'));
    end
    new_case.length = length;
    
    width = str2double(input('Width: ','s'));
    while (width < 60.3) || (width > 72.3)
    width = str2double(input('Width: ','s'));
    end
    new_case.width = width;
    
    height = str2double(input('Height: ','s'));
    while (height < 47.8) || (height > 59.8)
    height = str2double(input('Height: ','s'));
    end
    new_case.height = height;
    
    curbWeight = str2double(input('Curb Weight: ','s'));
    while (curbWeight < 1488) || (curbWeight > 4066)
    curbWeight = str2double(input('Curb Weight: ','s'));
    end
    new_case.curb_weight = curbWeight;
    
    engineType = input('Engine Type: ','s');
    while ~any(strcmp(engine_tipos, engineType))
    engineType = input('Engine Type: ','s');
    end
    new_case.engine_type = engineType;
    
    cylinders = input('Numbers of Cylinders: ','s');
    while ~any(strcmp(num_Of_Cylinders, cylinders))
    cylinders = input('Numbers of Cylinders: ','s');
    end
    new_case.num_of_cylinders = cylinders;
    
    engineSize = str2double(input('Engine Size: ','s'));
    while (engineSize < 61) || (engineSize > 326) 
    engineSize = str2double(input('Engine Size: ','s'));
    end
    new_case.engine_size = engineSize;
    
    fuelSystem = input('Fuel System: ','s');
    while ~any(strcmp(fuel_system, fuelSystem))
    fuelSystem = input('Fuel System: ','s');
    end
    new_case.fuel_system = fuelSystem;
    
    bore = str2double(input('Bore: ','s'));
    while (bore < 2.54) || (bore > 3.94)
    bore = str2double(input('Bore: ','s'));
    end
    new_case.bore = bore;
    
    stroke = str2double(input('Stroke: ','s'));
    while (stroke < 2.07) || (stroke > 4.17)
    stroke = str2double(input('Stroke: ','s'));
    end
    new_case.stroke = stroke;
    
    compressionRatio = str2double(input('Compression Ratio: ','s'));
    while (compressionRatio < 7) || (compressionRatio > 23)
    compressionRatio = str2double(input('Compression Ratio: ','s'));
    end
    new_case.compression_ratio = compressionRatio;
    
    horsePower = str2double(input('Horse Power: ','s'));
    while (horsePower < 48) || (horsePower > 288)
    horsePower = str2double(input('Horse Power: ','s'));
    end
    new_case.horsepower = horsePower;
    
    peakRPM = str2double(input('Peak RPM: ','s'));
    while (peakRPM < 4150) || (peakRPM > 6600)
    peakRPM = str2double(input('Peak RPM: ','s'));
    end
    new_case.peak_rpm = peakRPM;
    
    cityMPG = str2double(input('City MPG: ','s'));
    while (cityMPG < 13) || (cityMPG > 49)
    cityMPG = str2double(input('City MPG: ','s'));
    end
    new_case.city_mpg = cityMPG;
    
    highwayMPG = str2double(input('Highway MPG: ','s'));
    while (highwayMPG < 16) || (highwayMPG > 54)
    highwayMPG = str2double(input('Highway MPG: ','s'));
    end
    new_case.highway_mpg = highwayMPG;
    
    price = str2double(input('Price: ', 's'));
    while (price < 5118) || (price > 45400)
    price = str2double(input('Price: ', 's'));
    end
    new_case.price = price;
    
%     
%     
%     
%     
%     new_case.symboling = 3;
%         new_case.normalized_losses = 245;
% 
%     marca = input('Marca do carro: ','s');
%     while ~any(strcmp(make, marca))
%     marca = input('Marca do carro: ','s');
%     fprintf('A MARCA É %s' ,marca)
%     end
%     new_case.make = marca;
%     
%     new_case.fuel_type = 'gas';
%    
%     new_case.aspiration = 'std';
%     
%     new_case.num_of_doors = 'two';
%    
%     new_case.body_style = 'convertible';
%     
%     new_case.drive_wheels = 'rwd';
%    
%     new_case.engine_location = 'front';
%    
%     new_case.wheel_base = 88.60;
%   
%     new_case.length = 168.80;
%     
%     new_case.width = 64.10;
%     
%     new_case.height = 48.80;
%     
%     new_case.curb_weight = 2548;
%     
%     new_case.engine_type = 'dohc';
%     
%     new_case.num_of_cylinders = 'four';
%     new_case.engine_size = 130;
%   
%     new_case.fuel_system = 'mpfi';
%     
%     new_case.bore = 3.47;
%     
%     new_case.stroke = 2.68;
%     
%     new_case.compression_ratio = 9.00;
% 
%     new_case.horsepower = 111;
%  
%     new_case.peak_rpm = 5000;
% 
%     new_case.city_mpg = 21;
%  
%     new_case.highway_mpg = 27;
% 
%     new_case.price = 13495;

    
    disp(new_case);
    
    fprintf('\nStarting retrieve phase...\n\n');
    
    [retrieved_indexes, similarities, new_case] = retrieve(case_library, new_case, similarity_threshold,weighting_factors);
    
    retrieved_cases = case_library(retrieved_indexes, :);
    
    retrieved_cases.Similarity = similarities';

    fprintf('\nRetrieve phase completed...\n\n');
    
    [numRows,numCols] = size(retrieved_cases);
    %disp(numCols)
% posicao = 0;
%     maior = 0.0; 
%     lol = str2double(retrieved_cases(1,28));
%     disp(lol)
%     disp(retrieved_cases(1,28))
% for i=1:numRows
%     if(str2double(retrieved_cases(i,28)) >= maior) 
%         disp('ola')
%         maior = retrieved_cases(i,28);
%         posicao = i; 
%         
%     end
% end     
% disp(posicao)
%       disp(retrieved_cases(posicao,:)); 
%       aux = apresenta_x - 1;  
%       while(aux > 0)  
%         maioraux=0;
%         for i=1:numRows
%         if(str2double(retrieved_cases(i,28)) > maioraux && str2double(retrieved_cases(i,28)) <= maior)
%             maioraux=retrieved_cases(i,28);
%             posicao=i;
%         end
%         end
%             disp(retrieved_cases(posicao,:));
%             maior=maioraux;
%             aux = aux - 1;
%       end
    
% nao funciona problema a guardar valor       
      
    if (numRows >= apresenta_x)
        for i = 1:apresenta_x
            disp(retrieved_cases(i,:));
            fprintf('\n');
        end
    else
        disp(retrieved_cases);
    end
     fprintf('\nStarting reuse phase...\n\n');
     
     if fy == 0
     new_price = reuse(retrieved_cases, new_case);
     else
         new_price = fuzzyEscrito(new_case);
     end
     
     fprintf('\n\nReuse phase completed...\n');
    
     fprintf('\nStarting revise phase...\n\n');

     [car, new_case] = revise(retrieved_cases, new_case, new_price);
    
     final_index = find(case_library{:,1} == car);
   
     fprintf('\nRevise phase completed...\n');
   
    fprintf('\nStarting retain phase...\n\n');

    case_library = retain(case_library, new_case, final_index);
    
    fprintf('\nRetain phase completed...\n\n');
    
    disp(case_library(size(case_library,1), :));

end

