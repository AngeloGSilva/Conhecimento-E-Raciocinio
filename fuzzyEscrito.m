function out = fuzzyEscrito(new_case)

fis_car = newfis('Fuzzy');

fis_car = addvar (fis_car, 'input', 'Hourse_Power', [48 288]);
fis_car = addvar (fis_car, 'input', 'City_MPG', [13 49]);
fis_car = addvar (fis_car, 'input', 'Highway_MPG', [16 54]);
fis_car = addvar (fis_car, 'input', 'Engine_Size', [1000 5400]);
fis_car = addvar (fis_car, 'input', 'Length', [141.1 208.1]);
fis_car = addvar (fis_car, 'input', 'Symboling', [-3 3]);
fis_car = addvar (fis_car, 'output', 'Price', [5118 45400]);

fis_car = addmf (fis_car, 'input', 1, 'Baixo', 'trimf',[48 70 100]);
fis_car = addmf (fis_car, 'input', 1, 'Medio', 'trimf',[100 140 185]);
fis_car = addmf (fis_car, 'input', 1, 'Alto', 'trimf',[185 220 288]);

fis_car = addmf (fis_car, 'input', 2, 'Mau', 'trimf',[13 17 21]);
fis_car = addmf (fis_car, 'input', 2, 'Razoavel', 'trimf',[21 26 31]);
fis_car = addmf (fis_car, 'input', 2, 'Bom', 'trimf',[31 40 49]);

fis_car = addmf (fis_car, 'input', 3, 'Mau', 'trimf',[16 20 25]);
fis_car = addmf (fis_car, 'input', 3, 'Razoavel', 'trimf',[25 30 36]);
fis_car = addmf (fis_car, 'input', 3, 'Bom', 'trimf',[36 44 54]);

fis_car = addmf (fis_car, 'input', 4, 'Baixo', 'trimf',[61 85 115]);
fis_car = addmf (fis_car, 'input', 4, 'Medio', 'trimf',[115 165 215]);
fis_car = addmf (fis_car, 'input', 4, 'Alto', 'trimf',[215 265 326]);

fis_car = addmf (fis_car, 'input', 5, 'Pequeno', 'trimf',[141.1 155 166]);
fis_car = addmf (fis_car, 'input', 5, 'Medio', 'trimf',[166 178 190]);
fis_car = addmf (fis_car, 'input', 5, 'Grande', 'trimf',[190 199 208.1]);

fis_car = addmf (fis_car, 'input', 6, 'Pouco_Seguro', 'trimf',[-3 -2 -1]);
fis_car = addmf (fis_car, 'input', 6, 'Seguro', 'trimf',[-1 0 1]);
fis_car = addmf (fis_car, 'input', 6, 'Muito_Seguro', 'trimf',[1 2 3]);

fis_car = addmf (fis_car, 'output', 1, 'Baixo', 'trimf',[5118 9000 14000]);
fis_car = addmf (fis_car, 'output', 1, 'Medio', 'trimf',[14106.5661375661 20106.5661375661 30106.5661375661]);
fis_car = addmf (fis_car, 'output', 1, 'Alto', 'trimf',[30000 45400 100000]);

rules = [1 3 3 1 1 1 1 1 1;
        1 3 3 1 2 1 1 1 1;
        1 3 3 1 3 1 1 1 1;
        1 3 3 1 1 2 1 1 1;
        1 3 3 1 2 3 2 1 1;
        1 3 3 1 3 3 2 1 1;
        1 3 3 2 3 3 2 1 1;
        1 3 3 2 2 3 2 1 1;
        1 3 3 2 1 3 2 1 1;
        1 3 3 2 1 2 2 1 1;
        1 3 3 2 2 2 2 1 1;
        1 3 3 2 3 2 2 1 1;
        1 3 3 2 3 1 1 1 1;
        1 3 3 2 2 1 1 1 1;
        1 3 3 2 1 1 1 1 1;
        1 2 2 1 1 1 1 1 1;
        1 2 2 1 2 1 1 1 1;
        1 2 2 1 3 1 1 1 1;
        1 2 2 1 3 2 2 1 1;
        1 2 2 1 2 2 2 1 1;
        1 2 2 1 1 2 2 1 1;
        1 2 2 1 1 3 3 1 1;
        1 2 2 1 2 3 3 1 1;
        1 2 2 1 3 3 3 1 1;
        1 1 1 1 3 3 3 1 1;
        1 1 1 1 1 3 2 1 1;
        1 1 1 1 2 3 2 1 1;
        1 1 1 1 3 3 2 1 1;
        1 1 1 1 3 2 2 1 1;
        1 1 1 1 2 2 2 1 1;
        1 1 1 1 1 2 2 1 1;
        1 1 1 1 1 1 1 1 1;
        1 1 1 1 2 1 1 1 1;
        1 1 1 1 3 1 1 1 1;
        3 1 1 3 3 1 2 1 1;
        3 1 1 3 2 1 2 1 1;
        3 1 1 3 1 1 2 1 1;
        3 1 1 3 1 2 2 1 1;
        3 1 1 3 2 2 2 1 1;
        3 1 1 3 3 2 3 1 1;
        3 1 1 3 3 3 3 1 1;
        3 1 1 3 2 3 3 1 1;
        3 1 1 3 1 3 3 1 1;
        3 1 1 2 1 3 3 1 1;
        3 1 1 2 2 3 3 1 1;
        3 1 1 2 3 3 3 1 1;
        3 1 1 2 2 2 2 1 1;
        3 1 1 2 1 2 2 1 1;
        3 1 1 2 3 1 2 1 1;
        3 1 1 2 2 1 2 1 1;
        3 1 1 2 1 1 2 1 1;
        3 1 1 1 1 1 2 1 1;
        3 1 1 1 1 2 2 1 1;
        3 1 1 1 1 3 2 1 1;
        3 1 1 1 2 3 2 1 1;
        3 1 1 1 2 2 2 1 1;
        3 1 1 1 3 2 2 1 1;
        2 2 2 1 3 1 2 1 1;
        2 2 2 1 2 1 2 1 1;
        2 2 2 1 1 1 2 1 1;
        2 2 2 1 1 2 2 1 1;
        2 2 2 1 2 2 2 1 1;
        2 2 2 1 3 2 2 1 1;
        2 2 2 1 3 3 3 1 1;
        2 2 2 1 2 3 2 1 1;
        2 2 2 1 1 3 2 1 1;
        2 3 3 1 1 3 2 1 1;
        2 3 3 1 2 3 2 1 1;
        2 3 3 1 3 3 3 1 1;
        2 3 3 1 3 2 2 1 1;
        2 3 3 1 2 2 2 1 1;
        2 3 3 1 1 2 2 1 1;
        2 3 3 1 1 1 1 1 1;
        2 3 3 1 2 1 1 1 1;
        2 3 3 1 3 1 2 1 1;
        2 3 3 2 3 1 2 1 1;
        2 3 3 2 2 1 2 1 1;
        2 3 3 2 1 1 2 1 1;
        2 3 3 2 1 2 2 1 1;
        2 3 3 2 2 2 3 1 1;
        2 3 3 2 3 2 3 1 1;
        2 3 3 2 3 3 3 1 1;
        2 3 3 2 2 3 3 1 1;
        2 3 3 2 1 3 3 1 1;];
     
fis_car = addrule(fis_car, rules);
in = [new_case.horsepower, new_case.city_mpg , new_case.highway_mpg ,new_case.engine_size, new_case.length, new_case.symboling];
out = evalfis (in, fis_car);
fprintf('Tendo em conta o Horse Power, City MPG , Highway MPG, Engine Size , Length, e o Symboling(Segurança) o preco estimado é %.3f, sem ser %.3f', out , new_case.price)
end