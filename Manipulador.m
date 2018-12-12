
%testa se existe conexÃ£o serial ativa no pc

%setando a porta serial para comunicaÃ§Ã£o
 

%Setando configuraÃ§Ãµes para a porta
%set(port, "baudrate", 115200) %baudrate
%set(port, "bytesize", 5)    %tamanho da mensagem
%set(port, "parity", "N")    %(E)ven (O)dd (N)one
%set(port, "stopbits", 2)    %1 ou 2
%set(port, "dataterminalready", "on")  %DTR line on or off
%set(port, "requesttosend", "on")   %RTS line on or off
delete(instrfind);
port = serial('COM14','BaudRate',115200); %Cria a porta com 115200 de boudrate
set(port,'Terminator','CR')
base  = 750;
base2 = 550; 
erro = 0; 
message = '';
question = '';
angulos = [0 0 0 0 0 0];
joints = 0;
while true
    fopen(port);
    angulos = [0 0 0 0 0 0];
    opcao = 0;
    while opcao~=1 && opcao ~=2
        disp('Menu')
        disp('1 - Mover todas as juntas');
        disp('2 - Mover apenas uma junta');
        opcao = input('Selecione o tipo de operação: '); 
    end
    
    switch (opcao)
        case 1
            %Laço para coleta de angulos para as juntas
            for joints = 0:5
                x = sprintf('Junta %d',joints + 1);
                disp(x);
                value = input('Informe um ângulo: ');
                result = physicalLimits(value, joints+1);
                while result == 1
                    value = input('Informe outro valor: ');
                    result = physicalLimits(value, joints+1);
                end
                angulos(joints + 1) = value;
                disp('Angulo armazenado');
            end
            question = input('Deseja enviar? (Sim = 1/ Não = 0): ');
            if question == 1
                [erro, message] = checkConfiguration(angulos);
                if erro == 1
                    disp('Erro na configuração das juntas');
                    %mostra qual foi o erro
                    disp(message);
                else
                    %enviar angulos
                    power = convert_degrees(angulos,base,base2);
                    disp(power);
                    comando = strcat('#16 P', int2str(power(1)), ' #17 P', int2str(power(2)), ' #20 P', int2str(power(3)), ' #21 P', int2str(power(4)), ' #22 P', int2str(power(5)), ' #23 P', int2str(power(6)),' T3500\n');
                    fprintf(port, '%s', comando);
                    disp(comando);
                    disp('Angulos escolhidos: ');
                    for counter = 1:6
                        disp(angulos(counter));
                    end

                end
            end
        case 2
            x = input('Junta :');
            value = input('Informe um ângulo: ');
            result = physicalLimits(value, x);
            while result == 1
                value = input('Informe outro valor: ');
                result = physicalLimits(value, x);
            end
            angulos(1) = value;
            power = convert_degrees(angulos,base,base2);
            switch x
                case 1
                    comando = strcat('#16 P', int2str(power(1)),' T3500\n');
                case 2
                    comando = strcat('#17 P', int2str(power(1)),' T3500\n');
                case 3
                    comando = strcat('#20 P', int2str(power(1)),' T3500\n');
                case 4
                    comando = strcat('#21 P', int2str(power(1)),' T3500\n');
                case 5
                    comando = strcat('#22 P', int2str(power(1)),' T3500\n');
                case 6
                    comando = strcat('#23 P', int2str(power(1)),' T3500\n');
            end
            fprintf(port, '%s', comando);
            disp(comando);
    end
    fclose(port);
end






%enter = 1;
%while enter ~= 0
%   enter = input('Digite uma valor:');
%   if entrada >= 750 && enter <= 2250
%       comando = strcat('#22 P ', int2str(enter), '\n');
%       fprintf(s, '%s', comando);
%       disp(comando);
%   end
%end

%fclose(s);
%recebe os valores dos angulos em graus
%teta1 = input("Teta1: ")
%teta2 = input("Teta2: ")
%teta3 = input("Teta3: ")
%teta4 = input("Teta4: ")
%teta5 = input("Teta5: ")

%converte de graus pra radiandos
%teta1rad = teta1/180*pi
%teta2rad = teta2/180*pi
%teta3rad = teta3/180*pi
%teta4rad = teta4/180*pi
%teta5rad = teta5/180*pi

%calculando as matrizes de transformaÃ§Ã£o
%t01 = [cos(teta1rad), -sin(teta1rad), 0, 0; 
%      sin(teta1rad), cos(teta1rad), 0, 0;
%      0, 0, 1, 11; 
%      0, 0, 0, 1]

%t12 = [cos(teta2rad), -sin(teta2rad), 0, 0; 
%        0, 0, -1, 0;
%        sin(teta2rad), sin(teta2rad), 0, 0;
%        0, 0, 0, 1]

%t23 = [cos(teta3rad), -sin(teta3rad), 0, 15.3; 
%        sin(teta3rad), cos(teta3rad), 0, 0;
%        0, 0, 1, 0; 
%        0, 0, 0, 1]
%t34 = [cos(teta4rad), -sin(teta4rad), 0, 15.3; 
%        sin(teta4rad), cos(teta4rad), 0, 0;
%        0, 0, 1, 0; 
%        0, 0, 0, 1]

%t45 = [cos(teta5rad), -sin(teta5rad), 0, 0; 
%        0, 0, -1, -3.1;
%        sin(teta5rad), cos(teta5rad), 0, 0;
%        0, 0, 0, 1]
        
% t05 = t01*t12*t23*t34*t45
 
 



