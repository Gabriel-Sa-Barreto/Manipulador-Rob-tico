function [erro, message] = checkConfiguration(angulos)
   erro = 0;
   message = '';
   if angulos(2) > 150 && angulos(3) < 90 && angulos(4) > 90 
       erro = 1;
   end
   
   if ((angulos(1) >= 140 || angulos(1) <= 40) && angulos(2) > 145 && angulos(3) < 90)
        erro = 1;    
   end
   
   if angulos(2) > 150 && angulos(3) <= 120
        erro = 1;     
   end        
   if erro == 1
       message = 'Essa configuração não é possível!!';
   end
end