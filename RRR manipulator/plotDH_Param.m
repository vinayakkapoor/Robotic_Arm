function plotDH_Param(theta1, theta3, theta4, L1, L2)

    DH=[0 0 0 theta1; 0 90 0 0; L1 0 0 theta3; L2 0 0 theta4];
    T_01=transform(DH(1,1),DH(1,2),DH(1,3),DH(1,4));
    T_12=transform(DH(2,1),DH(2,2),DH(2,3),DH(2,4));
    T_23=transform(DH(3,1),DH(3,2),DH(3,3),DH(3,4));
    T_34=transform(DH(4,1),DH(4,2),DH(4,3),DH(4,4));

    T_03=T_01*T_12*T_23;
    T_04=T_03*T_34;

    plot3([0 T_03(1,4)],[0 T_03(2,4)],[0 T_03(3,4)]);
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    hold on;
    plot3([T_03(1,4) T_04(1,4)],[T_03(2,4) T_04(2,4)],[T_03(3,4) T_04(3,4)]);
    xlim([-3 3]);
    ylim([-3 3]);
    zlim([-3 3]);
    hold off;
end