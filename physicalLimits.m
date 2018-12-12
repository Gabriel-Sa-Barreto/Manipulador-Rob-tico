function result = physicalLimits(value, joint)
    switch joint
        case 1
            if(value > 180)
                result = 1; %erro encontrado
                disp('Angulo fora do limite físico. Informe entre 0 e 180');
            else
                result = 0;
            end
        case 2
            if(value < 30 || value > 165)
                result = 1; %erro encontrado.
                disp('Angulo fora do limite físico. Informe entre 30 e 165');
            else
                result = 0;
            end
            
        case 3
            if(value < 30 || value > 160)
                result = 1; %erro encontrado.
                disp('Angulo fora do limite físico. Informe entre 30 e 160');
            else
                result = 0;
            end
            
        case 4
            if(value < 10 || value > 170)
                result = 1; %erro encontrado.
                disp('Angulo fora do limite físico. Informe entre 10 e 170');
            else
                result = 0;
            end
            
        case 5
            if(value > 180)
                result = 1; %erro encontrado
                disp('Angulo fora do limite físico. Informe entre 0 e 180');
            else
                result = 0;
            end
        otherwise
             result = 0;
    end
end