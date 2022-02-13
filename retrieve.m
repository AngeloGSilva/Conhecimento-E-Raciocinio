function [retrieved_indexes, similarities, new_case] = retrieve(case_library, new_case, threshold, weighting_factors)
    

%fprintf('valores no retrive');
%weighting_factors

    %weighting_factors = [ 2 1 4 3 5 4 5 5 5 3 1 4 1 3 3 2 5 4 2 1 1 4 2 3 4 4];
    
    make_type_sim = get_make_type_similarities();
    get_fuel_type_sim = get_fuel_type_similarities();
    get_aspiration_sim = get_aspiration_similarities();
    get_num_of_doors_sim = get_num_of_doors_similarities();
    body_style_sim = get_body_style_similarities();
    get_drive_wheels_sim = get_drive_wheels_similarities();
    get_engine_location_sim = get_engine_location_similarities();
    get_engine_type_sim = get_engine_type_similarities();
    get_num_of_cylinders_sim = get_num_of_cylinders_similarities();
    get_fuel_system_sim = get_fuel_system_similarities();
   
    
    max_values = get_max_values(case_library);
    
      
    retrieved_indexes = [];
    similarities = [];
    
    %
    
    for i=1:size(case_library,1)
        distances = zeros(1,26);
        distances(1,1) = calculate_linear_distance( case_library{i,'symboling'} / max_values('symboling'), new_case.symboling / max_values('symboling'));
        distances(1,2) = calculate_linear_distance( case_library{i,'normalized_losses'} / max_values('normalized_losses'), new_case.normalized_losses / max_values('normalized_losses'));
        distances(1,3) = calculate_local_distance( make_type_sim, case_library{i,'make'}, new_case.make);
        distances(1,4) = calculate_local_distance( get_fuel_type_sim, case_library{i,'fuel_type'}, new_case.fuel_type);
        distances(1,5) = calculate_local_distance( get_aspiration_sim, case_library{i,'aspiration'}, new_case.aspiration);
        distances(1,6) = calculate_local_distance( get_num_of_doors_sim, case_library{i,'num_of_doors'}, new_case.num_of_doors);
        distances(1,7) = calculate_local_distance( body_style_sim, case_library{i,'body_style'}, new_case.body_style);
        distances(1,8) = calculate_local_distance( get_drive_wheels_sim, case_library{i,'drive_wheels'}, new_case.drive_wheels);
        distances(1,9) = calculate_local_distance( get_engine_location_sim, case_library{i,'engine_location'}, new_case.engine_location);
        distances(1,10) = calculate_linear_distance( case_library{i,'wheel_base'} / max_values('wheel_base'), new_case.wheel_base / max_values('wheel_base'));
        distances(1,11) = calculate_linear_distance( case_library{i,'length'} / max_values('length'), new_case.length / max_values('length'));
        distances(1,12) = calculate_linear_distance( case_library{i,'width'} / max_values('width'), new_case.width / max_values('width'));
        distances(1,13) = calculate_linear_distance( case_library{i,'height'} / max_values('height'), new_case.height / max_values('height'));
        distances(1,14) = calculate_linear_distance( case_library{i,'curb_weight'} / max_values('curb_weight'), new_case.curb_weight / max_values('curb_weight'));
        distances(1,15) = calculate_local_distance( get_engine_type_sim, case_library{i,'engine_type'}, new_case.engine_type);
        distances(1,16) = calculate_local_distance( get_num_of_cylinders_sim, case_library{i,'num_of_cylinders'}, new_case.num_of_cylinders);
        distances(1,17) = calculate_linear_distance( case_library{i,'engine_size'} / max_values('engine_size'), new_case.engine_size / max_values('engine_size'));
        distances(1,18) = calculate_local_distance( get_fuel_system_sim, case_library{i,'fuel_system'}, new_case.fuel_system);
        distances(1,19) = calculate_linear_distance( case_library{i,'bore'} / max_values('bore'), new_case.bore / max_values('bore'));
        distances(1,20) = calculate_linear_distance( case_library{i,'stroke'} / max_values('stroke'), new_case.stroke / max_values('stroke'));
        distances(1,21) = calculate_linear_distance( case_library{i,'compression_ratio'} / max_values('compression_ratio'), new_case.compression_ratio / max_values('compression_ratio'));
        distances(1,22) = calculate_linear_distance( case_library{i,'horsepower'} / max_values('horsepower'), new_case.horsepower / max_values('horsepower'));
        distances(1,23) = calculate_linear_distance( case_library{i,'peak_rpm'} / max_values('peak_rpm'), new_case.peak_rpm / max_values('peak_rpm'));
        distances(1,24) = calculate_linear_distance( case_library{i,'city_mpg'} / max_values('city_mpg'), new_case.city_mpg / max_values('city_mpg'));
        distances(1,25) = calculate_linear_distance( case_library{i,'highway_mpg'} / max_values('highway_mpg'), new_case.highway_mpg / max_values('highway_mpg'));  
        distances(1,26) = calculate_euclidean_distance(case_library{i,'price'} / max_values('price'), new_case.price / max_values('price'));


        final_similarity = 1 - ((distances * weighting_factors') / sum(weighting_factors));
        
        if final_similarity >= threshold
            retrieved_indexes = [retrieved_indexes i];
            similarities = [similarities final_similarity];
        end
        
        fprintf('Case %d out of %d has a similarity of %.2f%%...\n', i, size(case_library,1), final_similarity*100);
    end
end

function [fuel_system_sim] = get_fuel_system_similarities()

    fuel_system_sim.categories = categorical({'1bbl',  '2bbl',  '4bbl', 'idi', 'mfi', 'mpfi',  'spdi', 'spfi'});

    fuel_system_sim.similarities = [
        % 1bbl  |  2bbl  |    4bbl |   idi |      mfi |       mpfi  |   spdi   |  spfi
           1.0      0.6       0.5      0.2        0.3         0.7        0.8       0.1      % 1bbl
           0.6      1.0       0.2      0.1        0.3         0.8        0.5       0.5      % 2bbl
           0.5      0.2       1.0      0.8        0.9         0.7        0.2       0.6      % 4bbl
           0.2      0.1       0.8      1.0        0.8         0.5        0.1       0.2      % idi
           0.3      0.3       0.9      0.8        1.0         0.2        0.0       0.4      % mfi
           0.7      0.8       0.7      0.5        0.2         1.0        0.2       0.5      % mpfi
           0.8      0.5       0.2      0.1        0.0         0.2        1.0       0.5      % spdi
           0.1      0.5       0.6      0.2        0.4         0.5        0.5       1.0     % spfi
    ];
end

function [make_type_sim] = get_make_type_similarities()

    make_type_sim.categories = categorical({'alfa-romero', 'audi', 'bmw', 'chevrolet', 'dodge', 'honda', 'isuzu', 'jaguar', 'mazda', 'mercedes-benz', 'mercury', 'mitsubishi', 'nissan', 'peugot', 'plymouth', 'porsche', 'renault', 'saab', 'subaru', 'toyota', 'volkswagen', 'volvo'});

    make_type_sim.similarities = [
        %alfa-romero | audi | bmw | chevrolet | dodge | honda | isuzu | jaguar | mazda | mercedes-benz | mercury | mitsubishi | nissan | peugot | plymouth | porsche | renault | saab | subaru | toyota | volkswagen | volvo 
            1.0		  0.2    0.0	0.2			0.6		0.4		0.8		0.0		0.2			0.6			 0.4		0.8			0.0		 0.2	   0.6		 0.4	   0.8		0.0		0.2		 0.6	   0.4		   0.8 %	alfa-romero 
            0.8		  1.0    0.0	0.2			0.6		0.4		0.8		0.0		0.2			0.6			 0.4		0.8			0.0		 0.2	   0.6		 0.4	   0.8		0.0		0.2		 0.6	   0.4		   0.8	%audi 
            0.0		  0.8    1.0	0.0			0.2		0.6		0.4		0.8		0.0			0.2			 0.6		0.4			0.8		 0.0	   0.2		 0.6	   0.4		0.8		0.0		 0.2	   0.6		   0.4	%bmw 
            0.2		  0.0    0.8	1.0			0.0		0.2		0.6		0.4		0.8			0.0			 0.2		0.6			0.4		 0.8	   0.0		 0.2	   0.6		0.4		0.8		 0.0	   0.2		   0.6	%chevrolet 
            0.6		  0.2    0.0	0.8			1.0		0.0		0.2		0.6		0.4			0.8			 0.0		0.2			0.6		 0.4	   0.8		 0.0	   0.2		0.6		0.4		 0.8	   0.0		   0.2	%dodge 
            0.4		  0.6    0.2	0.0			0.8		1.0		0.0		0.2		0.6			0.4			 0.8		0.0			0.2		 0.6	   0.4		 0.8	   0.0		0.2		0.6		 0.4	   0.8		   0.0	%honda 
            0.8		  0.4    0.6	0.2			0.0		0.8		1.0		0.0		0.2			0.6			 0.4		0.8			0.0		 0.2	   0.6		 0.4	   0.8		0.0		0.2		 0.6	   0.4		   0.8	%isuzu 
            0.0		  0.8    0.4	0.6			0.2		0.0		0.8		1.0		0.0			0.2			 0.6		0.4			0.8		 0.0	   0.2		 0.6	   0.4		0.8		0.0		 0.2	   0.6		   0.4	%jaguar 
            0.2		  0.0    0.8	0.4			0.6		0.2		0.0		0.8		1.0			0.0			 0.2		0.6			0.4		 0.8	   0.0		 0.2	   0.6		0.4		0.8		 0.0	   0.2		   0.6	%mazda 
            0.6		  0.2    0.0	0.8			0.4		0.6		0.2		0.0		0.8			1.0			 0.0		0.2			0.6		 0.4	   0.8		 0.0	   0.2		0.6		0.4		 0.8	   0.0		   0.2	%mercedes-benz 
            0.4		  0.6    0.2	0.0			0.8		0.4		0.6		0.2		0.0			0.8			 1.0		0.0			0.2		 0.6	   0.4		 0.8	   0.0		0.2		0.6		 0.4	   0.8		   0.0	%mercury 
            0.8		  0.4    0.6	0.2			0.0		0.8		0.4		0.6		0.2			0.0			 0.8		1.0			0.0		 0.2	   0.6		 0.4	   0.8		0.0		0.2		 0.6	   0.4		   0.8	%mitsubishi 
            0.0		  0.8    0.4	0.6			0.2		0.0		0.8		0.4		0.6			0.2			 0.0		0.8			1.0		 0.0	   0.2		 0.6	   0.4		0.8		0.0		 0.2	   0.6		   0.4	%nissan 
            0.2		  0.0    0.8	0.4			0.6		0.2		0.0		0.8		0.4			0.6			 0.2		0.0			0.8		 1.0	   0.0		 0.2	   0.6		0.4		0.8		 0.0	   0.2		   0.6	%peugot 
            0.6		  0.2    0.0	0.8			0.4		0.6		0.2		0.0		0.8			0.4			 0.6		0.2			0.0		 0.8	   1.0		 0.0	   0.2		0.6		0.4		 0.8	   0.0		   0.2	%plymouth 
            0.4		  0.6    0.2	0.0			0.8		0.4		0.6		0.2		0.0			0.8			 0.4		0.6			0.2		 0.0	   0.8		 1.0	   0.0		0.2		0.6		 0.4	   0.8		   0.0	%porsche 
            0.8		  0.4    0.6	0.2			0.0		0.8		0.4		0.6		0.2			0.0			 0.8		0.4			0.6		 0.2	   0.0		 0.8	   1.0		0.0		0.2		 0.6	   0.4		   0.8	%renault 
            0.0		  0.8    0.4	0.6			0.2		0.0		0.8		0.4		0.6			0.2			 0.0		0.8			0.4		 0.6	   0.2		 0.0	   0.8		1.0		0.0		 0.2	   0.6		   0.4	%saab 
            0.2		  0.0    0.8	0.4			0.6		0.2		0.0		0.8		0.4			0.6			 0.2		0.0			0.8		 0.4	   0.6		 0.2	   0.0		0.8		1.0		 0.0	   0.2		   0.6	%subaru 
            0.6		  0.2    0.0	0.8			0.4		0.6		0.2		0.0		0.8			0.4			 0.6		0.2			0.0		 0.8	   0.4		 0.6	   0.2		0.0		0.8		 1.0	   0.0		   0.2	%toyota 
            0.4		  0.6    0.2	0.0			0.8		0.4		0.6		0.2		0.0			0.8			 0.4		0.6			0.2		 0.0	   0.8		 0.4	   0.6		0.2		0.0		 0.8	   1.0		   0.0	%volkswagen 
            0.8		  0.4    0.6	0.2			0.0		0.8		0.4		0.6		0.2			0.0			 0.8		0.4			0.6		 0.2	   0.0		 0.8	   0.4		0.6		0.2		 0.0	   0.8		   1.0	%volvo 

    ];
end

function [body_style_sim] = get_body_style_similarities()
 
    body_style_sim.categories = categorical({'hardtop', 'wagon', 'sedan', 'hatchback', 'convertible'});
    
    body_style_sim.similarities = [
         % hardtop | wagon | sedan | hatchback | convertible   
             1.0     0.8         0.6        0.2      0.6         % hardtop
             0.8     1.0         0.2        0.4      0.8         % wagon
             0.4     0.2         1.0        0.8      0.4         % sedan
             0.2     0.4         0.8        1.0      0.6         % hatchback
             0.6     0.8         0.4        0.6      1.0         % convertible
    ];
end


    
    function [get_fuel_type_sim] = get_fuel_type_similarities()
    get_fuel_type_sim.categories = categorical ({'diesel', 'gas'});
    get_fuel_type_sim.similarities = [
         % diesel | gas   
             1.0      0.6         % diesel
             0.4      1.0         % gas
             ];
    end
    
    function [get_aspiration_sim] = get_aspiration_similarities()   
    get_aspiration_sim.categories = categorical ({'std','turbo'});
    get_aspiration_sim.similarities = [
         % std | turbo   
             1.0      0.5         % std
             0.5      1.0         % turbo
             ];
    end
    
    function [get_num_of_doors_sim] = get_num_of_doors_similarities()
    get_num_of_doors_sim.categories = categorical ({'four','two'});
    get_num_of_doors_sim.similarities = [
         % four | two   
             1.0      0.5         % four
             0.5      1.0         % two
             ];
    end

    function [get_drive_wheels_sim] = get_drive_wheels_similarities()
    get_drive_wheels_sim.categories = categorical ({'4wd', 'fwd','rwd'});
     get_drive_wheels_sim.similarities = [
         % 4wd |     fwd     |  rwd   
            1.0      0.5       0.0   % 4wd
            0.0      1.0       0.5   % fwd
            0.5      0.0       1.0   % rwd
             ];
    end
    
    function [get_engine_location_sim] = get_engine_location_similarities()
    get_engine_location_sim.categories = categorical({'front','rear'});
    get_engine_location_sim.similarities = [
         % front | rear   
             1.0      0.5         % front
             0.5      1.0         % rear
             ];
    end
    
    function [get_engine_type_sim] = get_engine_type_similarities()
    get_engine_type_sim.categories = categorical({'dohc','dohcv','l','ohc','ohcf','ohcv','rotor'});
    get_engine_type_sim.similarities = [
        % 'dohc', 'dohcv', 'l', 'ohc', 'ohcf', 'ohcv', 'rotor'
				1.0      0.6       0.5      0.2        0.3         0.7        0.8    % 'dohc'
				0.6      1.0       0.2      0.1        0.3         0.8        0.5    % 'dohcv'
				0.5      0.2       1.0      0.8        0.9         0.7        0.2    % 'l'
				0.2      0.1       0.8      1.0        0.8         0.5        0.1    % 'ohc'
				0.3      0.3       0.9      0.8        1.0         0.2        0.0    % 'ohcf'
				0.7      0.8       0.7      0.5        0.2         1.0        0.2    % 'ohcv'
				0.8      0.5       0.2      0.1        0.0         0.2        1.0    % 'rotor'
    ];
    end
    
    function [get_num_of_cylinders_sim] = get_num_of_cylinders_similarities()
    get_num_of_cylinders_sim.categories = categorical({'eight','five','four','six','three','twelve','two'});
    get_num_of_cylinders_sim.similarities = [
			% 'eight', 'five', 'four', 'six', 'three', 'twelve', 'two'
				1.0      0.6       0.5      0.2        0.3         0.7        0.8    % 'eight'
				0.6      1.0       0.2      0.1        0.3         0.8        0.5    % 'five'
				0.5      0.2       1.0      0.8        0.9         0.7        0.2    % 'four'
				0.2      0.1       0.8      1.0        0.8         0.5        0.1    % 'six'
				0.3      0.3       0.9      0.8        1.0         0.2        0.0    % 'three'
				0.7      0.8       0.7      0.5        0.2         1.0        0.2    % 'twelve'
				0.8      0.5       0.2      0.1        0.0         0.2        1.0    % 'two'
    ];
    end
    

function [max_values] = get_max_values(case_library)

    key_set = {'symboling', 'normalized_losses', 'wheel_base', 'length', 'width', 'height', 'curb_weight', 'engine_size', 'bore', 'stroke', 'compression_ratio', 'horsepower', 'peak_rpm', 'city_mpg', 'highway_mpg', 'price'};
    value_set = {max(case_library{:,'symboling'}), max(case_library{:,'normalized_losses'}), max(case_library{:,'wheel_base'}), max(case_library{:,'length'}), max(case_library{:,'width'}), max(case_library{:,'height'}), max(case_library{:,'curb_weight'}), max(case_library{:,'engine_size'}), max(case_library{:,'bore'}), max(case_library{:,'stroke'}), max(case_library{:,'compression_ratio'}), max(case_library{:,'horsepower'}), max(case_library{:,'peak_rpm'}), max(case_library{:,'city_mpg'}), max(case_library{:,'highway_mpg'}), max(case_library{:,'price'})};
    max_values = containers.Map(key_set, value_set);
end

function [res] = calculate_local_distance(sim, val1, val2)

    i1 = find(sim.categories == val1);
    i2 = find(sim.categories == val2);
    res = 1 - sim.similarities(i1 ,i2);
end

function [res] = calculate_linear_distance(val1, val2)

    diff = abs(val1 - val2);
    res = sum(diff) / length(diff);
end

function [res] = calculate_euclidean_distance(val1, val2)
    res = (val1 - val2);
    %res = sqrt(diff * diff);
end




