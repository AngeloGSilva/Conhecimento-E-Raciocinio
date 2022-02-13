function [new_price] = reuse(retrieved_cases, new_case)

    x1 = retrieved_cases{:,2 }; %symboling
    x2 = retrieved_cases{:,3 }; %normalized_losses
    x3 = retrieved_cases{:,11 }; %wheel_base
    x4 = retrieved_cases{:,12 }; %length
    x5 = retrieved_cases{:,13 }; %width
    x6 = retrieved_cases{:,14 }; %height
    x7 = retrieved_cases{:,15 }; %curb_weight
    x8 = retrieved_cases{:,18 }; %engine_size
    x9 = retrieved_cases{:,20 }; %bore
    x10 = retrieved_cases{:,21 }; %stroke
    x11 = retrieved_cases{:,22 }; %compression_ratio
    x12 = retrieved_cases{:,23 }; %horsepower
    x13 = retrieved_cases{:,24 }; %peak_rpm
    x14 = retrieved_cases{:,25 }; %city_mpg
    x15 = retrieved_cases{:,26 }; %highway_mpg
    y = retrieved_cases{:,27 }; %price
    
    % Multiple Regression
    % Adapted from https://www.mathworks.com/examples/matlab/mw/matlab-ex88655142-multiple-regression
    
    X = [ones(size(x1)) x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15];
    
    b = X\y; %>>[b0 b1 b2]
    
    new_price = b(1) + b(2) * new_case.symboling + b(3) * new_case.normalized_losses + b(4) * new_case.wheel_base + b(5) * new_case.length + b(6) * new_case.width + b(7) * new_case.height + b(8) * new_case.curb_weight + b(9) * new_case.engine_size + b(10) * new_case.bore + b(11) * new_case.stroke + b(12) * new_case.compression_ratio + b(13) * new_case.horsepower + b(14) * new_case.peak_rpm + b(15) * new_case.city_mpg + b(16) * new_case.highway_mpg; % y2 = b0 + b1*x1 + b2*x2 .....
     
    fprintf(['Based on the attributes symboling  and normalized_losses and wheel_base and length and width and height and curb_weight and engine_size and bore and stroke and compression_ratio and horsepower and peak_rpm and city_mpg and highway_mpg  of the retrieved cases,\n', ...
                'the estimated price for the new case is %.2f, instead of %.2f.'], new_price, new_case.price);

end

