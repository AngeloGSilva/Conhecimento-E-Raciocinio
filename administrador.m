function [weighting_factors, apresenta_x] = administrador(weighting_factors, apresenta_x)

    tipos = {'symboling','normalized_losses','make','fuel_type','aspiration','num_of_doors','body_style','drive_wheels','engine_location',...
    'wheel_base','length','width','height','curb_weight','engine_type','num_of_cylinders','engine_size','fuel_system','bore','stroke',...
    'compression_ratio','horsepower','peak_rpm','city_mpg','highway_mpg','price'};

 
 
    formatSpec = '%f%f%f%C%C%C%C%C%C%C%f%f%f%f%f%C%C%f%C%f%f%f%f%f%f%f%f';

    case_library = readtable('cars.csv', ...
        'Delimiter', ',', ...
        'Format', formatSpec);
       %linhas = height (case_library);
    

op = -1;
while op ~= 0
    op = input ('1 - Ponderaçoes dos atributos \n2 - Adicionar\n3 - Editar\n4 - Remover \n5 - Alterar numero de casos apresentar\n6 - Sair\n Escolha:');
    switch op
        case 1
            
            for i=1:26
               disp(tipos(i));
               valor = input(':');
               while(valor < 0) || (valor > 5)
                   valor = input(':');
               end
               weighting_factors(i) = valor;
            end
%             fprintf('nao alterado')
%             weighting_factors
%             fprintf('\n')
%             weighting_factors() = 5;
%             fprintf('alterado')
%             weighting_factors
%             fprintf('\n')
            
            
        case 2
        new_case = adCarro();

        retain(case_library, new_case, 0);

        case_library = readtable('cars.csv', ...
            'Delimiter', ',', ...
            'Format', formatSpec);

        linhas = height(case_library);
        disp(case_library)
            
        case 3
            linhas = height(case_library);
            disp(case_library)
            codigo = input('Seleciona o carro');
            while (codigo < 0) || (codigo > linhas)
                codigo = input('Seleciona o carro: ');
            end
            disp(case_library(codigo,:))
            case_library = atualizacao(case_library, codigo);
            disp(case_library(codigo,:))
            
        case 4
            linhas = height(case_library);
            disp(case_library)
            codigo = input('Seleciona o carro');
            while (codigo < 0) || (codigo > linhas)
                codigo = input('Seleciona o carro: ');
            end
            disp(case_library(codigo,:))
            case_library = apagar(case_library, codigo);
        case 5
        apresenta_x = str2double(input('Numero de casos Apresentar: ','s'));   
        
        case 6
            break
    end
end
    

end


function [new_case] = adCarro()
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
    new_case.price = price

%         new_case.symboling = -1;
%         new_case.normalized_losses = 100;
% 
%     marca = input('Marca do carro: ','s');
%     while ~any(strcmp(make, marca))
%     marca = input('Marca do carro: ','s');
%     %fprintf('A MARCA É %s' ,marca)
%     end
%     new_case.make = marca;
%     
%     new_case.fuel_type = 'diesel';
%    
%     new_case.aspiration = 'std';
%     
%     new_case.num_of_doors = 'two';
%    
%     new_case.body_style = 'convertible';
%     
%     new_case.drive_wheels = 'rwd';
%    
%     new_case.engine_location = 'rear';
%    
%     new_case.wheel_base = 89.50;
%   
%     new_case.length = 168.90;
%     
%     new_case.width = 65.00;
%     
%     new_case.height = 51.60;
%     
%     new_case.curb_weight = 2800;
%     
%     new_case.engine_type = 'ohcf';
%     
%     new_case.num_of_cylinders = 'six';
%     new_case.engine_size = 194;
%   
%     new_case.fuel_system = 'mpfi';
%     
%     new_case.bore = 3.74;
%     
%     new_case.stroke = 2.90;
%     
%     new_case.compression_ratio = 9.50;
% 
%     new_case.horsepower = 100;
%  
%     new_case.peak_rpm = 5900;
% 
%     new_case.city_mpg = 17;
%  
%     new_case.highway_mpg = 25;
% 
%     new_case.price = 5118;
%     
end

function [case_library] = atualizacao(case_library, codigo)

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
    
    op = -1;
    while op ~=0
    escolha = input('1 - symboling\n2 - normalized_losses\n3 - make 4 - fuel_type\n5 - aspiration\n6 - num_of_doors\n7 - body_style\n8 - drive_wheels\n9 - engine_location\n10 - wheel_base\n11 - length\n12 - width\n13 - height\n14 - curb_weight\n15 - engine_type\n16 - num_of_cylinders\n17 - engine_size\n18 - fuel_system\n19 - bore\n20 - stroke\n21 - compression_ratio\n22 - horsepower\n23 - peak_rpm\n24 - city_mpg\n25 - highway_mpg\n26 - price\n Opcao: ')
        switch escolha
            case 1
            symboling = str2double(input('Symboling: ','s'));
                while (symboling < -3) || (symboling >3)
                    symboling = str2double(input('Symboling: ','s'));
                end
                case_library{codigo,2} = symboling;
            
        
            case 2
            normalizedLosses = str2double(input('Normalized Losses: ','s'));
                while (normalizedLosses < 65) || (normalizedLosses > 256)
                    normalizedLosses = str2double(input('Normalized Losses: ','s'));
                end
            case_library{codigo,3} = normalizedLosses;
             
        
            case 3
            marca = input('Marca do carro: ','s');
            while ~any(strcmp(make, marca))
                marca = input('Marca do carro: ','s');
            end
            for i=1:22
                if(strcmp(make(i),marca))
                    marca = make(i);
                end
            end
            case_library{codigo,4} = marca;
            
    
            case 4
            fuel_gas = input('Fuel type: ','s');
            while ~any(strcmp(fuel,fuel_gas))
                fuel_gas = input('Fuel type: ','s');
            end
            for i=1:2
                if(strcmp(fuel(i),fuel_gas))
                    fuel_gas = fuel(i);
                end
            end
            case_library{codigo,5} = fuel_gas;
            
    
            case 5
            aspiration = input('Aspiration: ','s');
            while ~any(strcmp(aspiration_tipos, aspiration))
                aspiration = input('Aspiration: ','s');
            end
            for i=1:2
                if(strcmp(aspiration_tipos(i),aspiration))
                    aspiration = aspiration_tipos(i);
                end
            end
            case_library{codigo,6} = aspiration;
            
    
            case 6
            doors = input('Number of doors: ','s');
            while ~any(strcmp(num_Of_Doors,doors))
                doors = input('Number of doors: ','s');
            end
            for i=1:2
                if(strcmp(num_Of_Doors(i),doors))
                    doors = num_Of_Doors(i);
                end
            end
            case_library{codigo,7} = doors;
            
    
            case 7 
            bodyStyle = input('Body Style:','s');
            while ~any(strcmp(body_style,bodyStyle))
                bodyStyle = input('Body Style:','s');
            end
            for i=1:5
                if(strcmp(body_style(i),bodyStyle))
                    bodyStyle = body_style(i);
                end
            end
            case_library{codigo,8} = bodyStyle;
    
            
            case 8
            driveWheels = input('Drive Wheels: ','s');
            while ~any(strcmp(drive_wheels,driveWheels))
                driveWheels = input('Drive Wheels: ','s');
            end
            for i=1:3
                if(strcmp(drive_wheels(i),driveWheels))
                    driveWheels = drive_wheels(i);
                end
            end
            case_library{codigo,9} = driveWheels;
            
    
            case 9
            engineLocation = input('Engine Location: ','s');
            while ~any(strcmp(engine_Location, engineLocation))
                engineLocation = input('Engine Location: ','s');
            end
            for i=1:2
                if(strcmp(engine_Location(i),engineLocation))
                    engineLocation = engine_Location(i);
                end
            end
            case_library{codigo,10} = engineLocation;
            
    
            case 10
            wheelBase = str2double(input('Wheel Base: ','s'));
            while (wheelBase < 86.6) || (wheelBase > 120.9)
                wheelBase = str2double(input('Wheel Base: ','s'));
            end
            case_library{codigo,11} = wheelBase;
            
    
            case 11
            length = str2double(input('Length: ','s'));
            while (length < 141.1) || (length > 208.1)
                length = str2double(input('Length: ','s'));
            end
            case_library{codigo,12} = length;
            
    
            case 12
            width = str2double(input('Width: ','s'));
            while (width < 60.3) || (width > 72.3)
                width = str2double(input('Width: ','s'));
            end
            case_library{codigo,13} = width;
            
    
            case 13
            height = str2double(input('Height: ','s'));
            while (height < 47.8) || (height > 59.8)
                height = str2double(input('Height: ','s'));
            end
            case_library{codigo,14} = height;
            
    
            case 14
            curbWeight = str2double(input('Curb Weight: ','s'));
            while (curbWeight < 1488) || (curbWeight > 4066)
                curbWeight = str2double(input('Curb Weight: ','s'));
            end
            case_library{codigo,15} = curbWeight;
            
    
            case 15
            engineType = input('Engine Type: ','s');
            while ~any(strcmp(engine_tipos, engineType))
                engineType = input('Engine Type: ','s');
            end
            for i=1:7
                if(strcmp(engine_tipos(i),engineType))
                    engineType = engine_tipos(i);
                end
            end
            case_library{codigo,16} = engineType;
            
    
            case 16
            cylinders = input('Numbers of Cylinders: ','s');
            while ~any(strcmp(num_Of_Cylinders, cylinders))
            cylinders = input('Numbers of Cylinders: ','s');
            end
            for i=1:7
                if(strcmp(num_Of_Cylinders(i),cylinders))
                    cylinders = num_Of_Cylinders(i);
                end
            end
            case_library{codigo,17} = cylinders;
            
    
            case 17
            engineSize = str2double(input('Engine Size: ','s'));
            while (engineSize < 61) || (engineSize > 326) 
                engineSize = str2double(input('Engine Size: ','s'));
            end
            case_library{codigo,18} = engineSize;
            
    
            case 18
            fuelSystem = input('Fuel System: ','s');
            while ~any(strcmp(fuel_system, fuelSystem))
                fuelSystem = input('Fuel System: ','s');
            end
            for i=1:8
                if(strcmp(fuel_system(i),fuelSystem))
                    fuelSystem = fuel_system(i);
                end
            end
            case_library{codigo,19} = fuelSystem;
            
    
            case 19
            bore = str2double(input('Bore: ','s'));
            while (bore < 2.54) || (bore > 3.94)
                bore = str2double(input('Bore: ','s'));
            end
            case_library{codigo,20} = bore;
            
    
            case 20
            stroke = str2double(input('Stroke: ','s'));
            while (stroke < 2.07) || (stroke > 4.17)
                stroke = str2double(input('Stroke: ','s'));
            end
            case_library{codigo,21} = stroke;
            break
    
            case 21
            compressionRatio = str2double(input('Compression Ratio: ','s'));
            while (compressionRatio < 7) || (compressionRatio > 23)
                compressionRatio = str2double(input('Compression Ratio: ','s'));
            end
            case_library{codigo,22} = compressionRatio;
            
    
            case 22
            horsePower = str2double(input('Horse Power: ','s'));
            while (horsePower < 48) || (horsePower > 288)
                horsePower = str2double(input('Horse Power: ','s'));
            end
            case_library{codigo,23} = horsePower;
            
    
            case 23
            peakRPM = str2double(input('Peak RPM: ','s'));
            while (peakRPM < 4150) || (peakRPM > 6600)
                peakRPM = str2double(input('Peak RPM: ','s'));
            end
            case_library{codigo,24} = peakRPM;
            
    
            case 24
            cityMPG = str2double(input('City MPG: ','s'));
            while (cityMPG < 13) || (cityMPG > 49)
                cityMPG = str2double(input('City MPG: ','s'));
            end
            case_library{codigo,25} = cityMPG;
            
    
            case 25
            highwayMPG = str2double(input('Highway MPG: ','s'));
            while (highwayMPG < 16) || (highwayMPG > 54)
                highwayMPG = str2double(input('Highway MPG: ','s'));
            end
            case_library{codigo,26} = highwayMPG;
            
    
            case 26
            price = str2double(input('Price: ', 's'));
            while (price < 5118) || (price > 45400)
                price = str2double(input('Price: ', 's'));
            end
            case_library{codigo,27} = price;
            
            case 27
                
                break
  
    end

    end
    writetable(case_library, 'cars.csv');
end


function [case_library] = apagar(case_library, codigo)
fprintf('Preparar para apagar carro\n'); 
disp(case_library(codigo,:))
case_library(codigo,:) = [];
fprintf('Carro apagado\n');
writetable(case_library, 'cars.csv');
end