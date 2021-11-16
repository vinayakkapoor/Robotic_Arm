function mapping(x0,x1,x2,x3,y0,y1,y2,y3,z0,z1,z2,z3)

i = 0:0.01:5;
x_1_2 = [x1(round(i*100 + 1)); x2(round(i*100 + 1))];
y_1_2 = [y1(round(i*100 + 1)); y2(round(i*100 + 1))];
z_1_2 = [z1(round(i*100 + 1)); z2(round(i*100 + 1))];
x_2_3 = [x2(round(i*100 + 1)); x3(round(i*100 + 1))];
y_2_3 = [y2(round(i*100 + 1)); y3(round(i*100 + 1))];
z_2_3 = [z2(round(i*100 + 1)); z3(round(i*100 + 1))];

for i = 0:0.01:5    
    
    p = plot3([x_1_2(1,round(i*100 + 1)),x_1_2(2,round(i*100 + 1))],[y_1_2(1,round(i*100 + 1)),y_1_2(2,round(i*100 + 1))],...
        [z_1_2(1,round(i*100 + 1)),z_1_2(2,round(i*100 + 1))],'b',[x_2_3(1,round(i*100 + 1)),x_2_3(2,round(i*100 + 1))],...
        [y_2_3(1,round(i*100 + 1)),y_2_3(2,round(i*100 + 1))],[z_2_3(1,round(i*100 + 1)),z_2_3(2,round(i*100 + 1))],'g',...
        [-3,3],[0,0],[0,0],'k',[0,0],[-3,3],[0,0],'k',[0,0],[0,0],[-3,3],'k');
    p(1).LineWidth = 2;
    p(2).LineWidth = 2;
    p(1).Marker = 'o';
    p(2).Marker = 'o';
    p(1).MarkerFaceColor = 'k';
    p(2).MarkerFaceColor = 'k';
    p(1).MarkerEdgeColor = 'k';
    p(2).MarkerEdgeColor = 'k';
    axis equal
    xlim([-3, 3]);
    ylim([-3, 3]);
    zlim([-3, 3]);
    grid on
    view([30 35]);    
    pause(0.01)
end

xlabel('X');
ylabel('Y');
zlabel('Z');
end
