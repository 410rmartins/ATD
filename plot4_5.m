function plot4_5(x, y, z, label)
    for i =1:length(label)
        if label(i) == 2
            a2 = plot3(x(i), y(i),z(i), 'o', 'MarkerEdgeColor',[0 1 0],'DisplayName','WALKING_UPSTAIRS');
        else
            a3 = plot3(x(i), y(i),z(i), '+', 'MarkerEdgeColor',[0 0 1],'DisplayName','WALKING_DOWNSTAIRS');
        end
    end
    l = [a2;a3];
    legend(l);
end