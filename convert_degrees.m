function power = convert_degrees(angulos,base, base2)
    result = [0 0 0 0 0 0];
    for counter = 1:6
        if counter == 2 || counter == 3 || counter == 4
            %regra 1
            percentage      = (angulos(counter)/180)*100;
            valuePercent    = (1500*percentage)/100;
            result(counter) = round((1500-valuePercent) + base);
        else
            %regra 2
            percentage      = (angulos(counter)/180)*100;
            valuePercent    = (1850*percentage)/100;
            result(counter) = round((1850-valuePercent) + base2);
        end
    end
    power = result;
end