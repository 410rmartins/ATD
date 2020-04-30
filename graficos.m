function graficos(nome, expr, matriz_atividade)
    typeLabels = {'W','W-U','W-D','SIT','STAND','LAY','STAND-SIT','SIT-STAND','SIT-LIE','LIE-SIT','STAND-LIE','LIE-STAND'};
    
    acc_x = expr(:,1);
    acc_y = expr(:,2);
    acc_z = expr(:,3);
    
    syms t
    t=0:7/(numel(acc_x)-1):7;
    anterior = t(1,1);
    figure;
    for j = 1 : 3
        subplot(3, 1, j)
        xlabel('Time (min)');
        title(nome);
        
        switch j
            case 1
                ylabel('ACC X');
                acc = acc_x;
                minimo = min(acc_x);
                maximo = max(acc_x);
            case 2
                ylabel('ACC Y');
                acc = acc_y;
                minimo = min(acc_y);
                maximo = max(acc_y);
            case 3
                ylabel('ACC Z');
                acc = acc_z;
                minimo = min(acc_z);
                maximo = max(acc_z);
        end
        hold on
        for i = 1 : length(matriz_atividade)
            atividade = matriz_atividade(i, 1);   
            tipo = typeLabels(atividade);
            inicio = matriz_atividade(i, 2);        
            fim = matriz_atividade(i, 3);
            if inicio ~= anterior + 1      
                atividade_acc = acc(anterior + 1 : (inicio - 1), :); 
                t_atividade = t(1, anterior + 1 : (inicio - 1)); 
                plot(t_atividade, atividade_acc, 'k');
            end
            atividade_acc = acc(inicio : fim, :); 
            t_atividade = t(1, inicio : fim);         
            if mod(i, 2) ~= 0
                text(t(1, inicio), minimo + 0.05, tipo, 'Color', 'k', 'FontSize', 7);
            else
                text(t(1, inicio), maximo - 0.1, tipo, 'Color', 'k', 'FontSize', 7);
            end
            plot(t_atividade, atividade_acc);
            anterior = fim;
        end
        if t(1, length(t)) ~= fim                  
            atividade_acc = acc(fim + 1 : length(t), :);
            t_atividade=t(1,fim+1:length(t)); 
            plot(t_atividade, atividade_acc, 'k');
        end
        hold off
    end 
end