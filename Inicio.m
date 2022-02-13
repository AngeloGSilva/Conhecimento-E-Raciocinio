function [] = Inicio ()
weighting_factors = [ 4	3	5	3	3	3	4	4	5	2	2	2	2	1	4	3	2	3	3	3	3	4	4	4	4	3 ];
apresenta_x = 15;
op = -1;
while op ~= 0
    op = input ('1 - Administrador \n2 - CBR\n3 - CBR C/FUZZY \n4 - Sair\n Escolha:');
    switch op
        case 1
            [weighting_factors, apresenta_x] = administrador(weighting_factors, apresenta_x);
            %disp (apresenta_x)
        case 2
            disp (apresenta_x)
            fy = 0;
            cbr(fy,weighting_factors, apresenta_x);
            
        case 3
            fy = 1;
            cbr(fy,weighting_factors, apresenta_x);
            
        case 4
            op = 0;
            break
    end
end
end