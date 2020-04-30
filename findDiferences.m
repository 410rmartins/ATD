function findDiferences()
    load('frequencias.mat');
    
    figure;
    hold on;
    temp = maxFreqs{1,1};
    disp(length(temp));

    for i=1:1:10
        temp = maxFreqs{1,i};
       
        k = 1;
        
        while k <= length(temp)
          
           activity = temp(k,4); 
           switch activity
               case 1
                   a1 = plot3(temp(k,1), temp(k,2),temp(k,3), '+','MarkerEdgeColor',[1 0 0],'DisplayName','WALKING');
               case 2
                   a2 = plot3(temp(k,1), temp(k,2),temp(k,3), '+', 'MarkerEdgeColor',[0 1 0],'DisplayName','WALKING_UPSTAIRS');
               case 3
                   a3 = plot3(temp(k,1), temp(k,2),temp(k,3), '+', 'MarkerEdgeColor',[0 0 1],'DisplayName','WALKING_DOWNSTAIRS');
               case 4
                   a4 = plot3(temp(k,1), temp(k,2),temp(k,3), '*', 'MarkerEdgeColor',[0 1 1],'DisplayName','SITTING');
               case 5
                   a5 = plot3(temp(k,1), temp(k,2),temp(k,3), '*', 'MarkerEdgeColor',[1 0 1],'DisplayName','STANDING');
               case 6
                   a6 = plot3(temp(k,1), temp(k,2),temp(k,3), '*', 'MarkerEdgeColor',[1 1 0],'DisplayName','LAYING');
               case 7
                   a7 = plot3(temp(k,1), temp(k,2),temp(k,3), 'o', 'MarkerEdgeColor',[0 0.2 0.3],'DisplayName','STAND_TO_SIT');
               case 8
                   a8 = plot3(temp(k,1), temp(k,2),temp(k,3), 'o', 'MarkerEdgeColor',[0.4 0.5 0.6],'DisplayName','SIT_TO_STAND');
               case 9
                   a9 = plot3(temp(k,1), temp(k,2),temp(k,3), 'o', 'MarkerEdgeColor',[0.7 0.8 0.9],'DisplayName','SIT_TO_LIE');
               case 10
                   a10 =  plot3(temp(k,1), temp(k,2),temp(k,3), 'o', 'MarkerEdgeColor',[0.4 0.75 0.33],'DisplayName','LIE_TO_SIT');
               case 11
                   a11 = plot3(temp(k,1), temp(k,2),temp(k,3), 'o', 'MarkerEdgeColor',[1 0.66 0.321],'DisplayName','STAND_TO_LIE');
               case 12
                   a12 = plot3(temp(k,1), temp(k,2),temp(k,3), 'o', 'MarkerEdgeColor',[0.420 0.420 0.420],'DisplayName','LIE_TO_STAND');
               otherwise
                   disp('erro nas diferencas')
           end
           k = k+1;
        end
    end
    
   
    l = [a1;a2;a3;a4;a5;a6;a7;a8;a9;a10;a11;a12];
    hold off
    legend(l)
    grid on;

end