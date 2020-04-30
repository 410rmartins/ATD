function [arrayFreqX, arrayFreqY, arrayFreqZ, labels, average_w, std_w, average_wu, std_wu, average_wd, std_wd, x, y, z, aux4_5] = calcDFTparte1(expr, matriz_atividade)
    typeLabels = {'W','W-U','W-D','SIT','STAND','LAY','STAND-SIT','SIT-STAND','SIT-LIE','LIE-SIT','STAND-LIE','LIE-STAND'};

    arrayFreqX = [];
    arrayFreqY = [];
    arrayFreqZ = [];
    labels = [];
    
    fs = 50;
    acc_x = expr(:,1);
    acc_y = expr(:,2);
    acc_z = expr(:,3);

    syms t
    x = [];
    y = [];
    z = [];
    aux4_5 = [];
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
               
                spectrum(acc_z, 50, 5, 0.45, matriz_atividade);
                acc = acc_z;
        end
        t = [0 : numel(acc) - 1]./fs;
        hold on
       
        w = [];
        wu = [];
        wd = [];
        for i = 1 : length(matriz_atividade)
            atividade = matriz_atividade(i, 1);
            tipo = typeLabels(atividade);
            inicio = matriz_atividade(i, 2);        
            fim = matriz_atividade(i, 3);
            
            if j ==1
                labels = [labels atividade];
            end
            
            atividade_acc = acc(inicio : fim, :);
            t_atividade = t(1, inicio : fim);
            
            if j == 1 
                freqMax = calcFreqMax(t_atividade, atividade_acc, tipo);
                arrayFreqX = [arrayFreqX freqMax];
                if (strcmp(tipo, typeLabels(7)) | strcmp(tipo, typeLabels(8)) | strcmp(tipo, typeLabels(12)) | strcmp(tipo, typeLabels(6))| strcmp(tipo, typeLabels(2)) | strcmp(tipo, typeLabels(3)))
                    if(~strcmp(tipo, typeLabels(2)) && ~strcmp(tipo, typeLabels(3)))
                        calcDFT(t_atividade, atividade_acc, tipo);
                    end
                end
                
                if(strcmp(tipo, typeLabels(2)) | strcmp(tipo, typeLabels(3)))
                    if(strcmp(tipo, typeLabels(2)))
                        aux4_5 = [aux4_5; 2];
                    else
                        aux4_5 = [aux4_5; 3];
                    end
                    
                    temp_x = calc_freq_peak(atividade_acc);
                    x = [x; temp_x];
                end
                
            elseif j == 2
                freqMax = calcFreqMax(t_atividade, atividade_acc, tipo);
                arrayFreqY = [arrayFreqY freqMax];
                if (strcmp(tipo, typeLabels(11)) | strcmp(tipo, typeLabels(10)) | strcmp(tipo, typeLabels(9)) | strcmp(tipo, typeLabels(5)) | strcmp(tipo, typeLabels(2)) | strcmp(tipo, typeLabels(3)))
                    if(~strcmp(tipo, typeLabels(2)) && ~strcmp(tipo, typeLabels(3)))
%                         calcDFT(t_atividade, atividade_acc, tipo);
                    end
                end
                
                if(strcmp(tipo, typeLabels(2)) | strcmp(tipo, typeLabels(3)))
                    temp_y = calc_freq_peak(atividade_acc);
                    y = [y; temp_y];
                end
                
            elseif j == 3
                freqMax = calcFreqMax(t_atividade, atividade_acc, tipo);
                arrayFreqZ = [arrayFreqZ freqMax];
                

                if (strcmp(tipo, typeLabels(4)))
%                     calcDFT(t_atividade, atividade_acc, tipo);
                
                elseif (strcmp(tipo, typeLabels(1)) | strcmp(tipo, typeLabels(2)) | strcmp(tipo, typeLabels(3)))

%                     calcDFT(t_atividade, atividade_acc, tipo);
                    passos = calcPassos(atividade_acc,tipo);
                    passos = passos*60;
                    
                    if(strcmp(tipo, typeLabels(2)) | strcmp(tipo, typeLabels(3)))
                        temp_z = calc_freq_peak(atividade_acc);
                        z = [z; temp_z];
                    end
                    
                    %dados para a tabela

                    if(strcmp(tipo, typeLabels(1)))
                        w = horzcat(w,passos);
                    elseif(strcmp(tipo, typeLabels(2)))
                       wu = horzcat(wu,passos);
                    else
                        wd = horzcat(wd,passos);
                    end
                    
                        
                end
            end
        end

        hold off
    end
    
    %construir a tabela
   
    %media
   
    average_w = sum(w) / length(w);
    %desvio padrao
  
    std_w = std(w);
  
    
     %media up
    
    average_wu = sum(wu) / length(wu);
    %desvio padrao
 
    std_wu = std(wu);
    
    %media
   
    average_wd = sum(wd) / length(wd);
    %desvio padrao
   
    std_wd = std(wd);
end