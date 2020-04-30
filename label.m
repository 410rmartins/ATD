function retorno = label(num)
    dadosLabel = importdata(".\ourData\labels.txt");
    
    experimentNumber = dadosLabel(:,1);
    activityNumber  = dadosLabel(:,3);
    startPoint = dadosLabel(:,4);
    endPoint = dadosLabel(:,5);

    % procura o inicio e o fim dos dados
    count = 0;
    for i = 1 : numel(experimentNumber)
        if(experimentNumber(i) == num)
            count = count + 1;
            if (count == 1)
                i_menor = i;
            end
            i_maior = i;
        end
    end
    
    activity = activityNumber(i_menor:i_maior);
    start = startPoint(i_menor:i_maior);
    endP = endPoint(i_menor:i_maior);

    retorno = [activity start endP];
end

