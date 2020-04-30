function calcAverageSignal(expr, matriz_atividade)
    typeLabels = {'W','W-U','W-D','SIT','STAND','LAY','STAND-SIT','SIT-STAND','SIT-LIE','LIE-SIT','STAND-LIE','LIE-STAND'};
    fs = 50;
    

    acc_x = expr(:,1);
    acc_y = expr(:,2);
    acc_z = expr(:,3);
    label_atividade = [];
    avg_sig_x = [];
    avg_sig_y = [];
    avg_sig_z = [];
    syms t
    
    for j = 1 : 3
        switch j
            case 1
                ylabel('ACC X');
                acc = acc_x;
            case 2
                ylabel('ACC Y');
                acc = acc_y;
            case 3
                ylabel('ACC Z');
                
                acc = acc_z;
        end
        disp(j)
        for i = 1 : length(matriz_atividade)
            atividade = matriz_atividade(i, 1);
            tipo = typeLabels(atividade);
            inicio = matriz_atividade(i, 2);        
            fim = matriz_atividade(i, 3);
            
            values = acc(inicio : fim, :);
            N = numel(values);
            %values = detrend(values);
            %calcular o vetor de frequencias
            if(mod(N,2)==0)
            %se o numero de pontos do sinal for par
                f=-fs/2:fs/N:fs/2-fs/N;
            else
            %Se o numero de pontos do sinal for impar
                f=-fs/2+fs/(2*N):fs/N:fs/2-fs/(2*N);
            end
            
            if(~strcmp(tipo, typeLabels(1)) && ~strcmp(tipo, typeLabels(2)) && ~strcmp(tipo, typeLabels(3)))
                
                X = fftshift(fft(values))/N;
                m_X = abs(X);
                ind = find(f >= 0);
                
                if j ==1
                    l = cumsum(m_X(ind))/sum(m_X(ind));
                    temp_ind = find(l > 0.7);
                    
                    avg_sig_x = [avg_sig_x; f(ind(temp_ind(1)))];

                elseif j == 2
                    l = cumsum(m_X(ind))/sum(m_X(ind));
                    temp_ind = find(l > 0.7);
                    
                    avg_sig_y = [avg_sig_y; f(ind(temp_ind(1)))];

                else
                    l = cumsum(m_X(ind))/sum(m_X(ind));
                    temp_ind = find(l > 0.7);
                    
                    avg_sig_z = [avg_sig_z; f(ind(temp_ind(1)))];


                end
                if j == 1
                    label_atividade = [label_atividade; atividade];
                end
            end
        end

    end
          
          
           
        temp = [avg_sig_x avg_sig_y avg_sig_z label_atividade];
        k = 1;
        while k <= length(temp)
          
           activity = temp(k,4); 
           switch activity
               
               case 4
                   l1 = plot3(temp(k,1), temp(k,2),temp(k,3), '+','MarkerEdgeColor',[1 0 0],'DisplayName','SIT')
               case 5
                   l2 = plot3(temp(k,1), temp(k,2),temp(k,3), '+', 'MarkerEdgeColor',[0 1 0],'DisplayName','STAND')
               case 6
                   l3 = plot3(temp(k,1), temp(k,2),temp(k,3), '+', 'MarkerEdgeColor',[0 0 1],'DisplayName','LAY')
              case 7
                   l4 = plot3(temp(k,1), temp(k,2),temp(k,3), 'o', 'MarkerEdgeColor',[0 0.2 0.3],'DisplayName','STAND_TO_SIT')
               case 8
                   l5 = plot3(temp(k,1), temp(k,2),temp(k,3), 'o', 'MarkerEdgeColor',[0.4 0.5 0.6],'DisplayName','SIT_TO_STAND')
               case 9
                   l6 = plot3(temp(k,1), temp(k,2),temp(k,3), 'o', 'MarkerEdgeColor',[0.7 0.8 0.9],'DisplayName','SIT_TO_LIE')
               case 10
                   l7 =  plot3(temp(k,1), temp(k,2),temp(k,3), 'o', 'MarkerEdgeColor',[0.4 0.75 0.33],'DisplayName','LIE_TO_SIT')
               case 11
                   l8 = plot3(temp(k,1), temp(k,2),temp(k,3), 'o', 'MarkerEdgeColor',[1 0.66 0.321],'DisplayName','STAND_TO_LIE')
               case 12
                   l9 = plot3(temp(k,1), temp(k,2),temp(k,3), 'o', 'MarkerEdgeColor',[0.420 0.420 0.420],'DisplayName','LIE_TO_STAND')
               otherwise
                   disp('erro nas diferencas')
           end
           k = k+1;
        end
        
    
        l = [l1;l2;l3;l4;l5;l6;l7;l8;l9];
        legend(l)
        grid on;

end