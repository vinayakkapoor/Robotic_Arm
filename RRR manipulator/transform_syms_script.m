syms T_01 T_12 T_23 T_34 theta1 theta3 theta4;
%T_01;T_12; T_23;T_34;theta1;theta3;theta4;
L1=1.5;
L2=1;
x=0.02;
y=0.3;
z=2.48106;
T_01=transform_syms(0, 0, 0, theta1);
T_12=transform_syms(0,pi/2, 0, 0);
T_23=transform_syms(L1,0,0,theta3);
T_34=transform_syms(L2,0,0,theta4);

T_04=T_01*T_12*T_23*T_34;

eqns=[T_04(1,4)-x==0 T_04(2,4)-y==0 T_04(3,4)-z==0];
%sols=solve(eqns, [theta1 theta3 theta4]);
%sols.theta1
%sols.theta3
%sols.theta4
%double(subs(T_04,[theta1 theta3 theta4],[sols.theta1 sols.theta3 sols.theta4]))
simp=simplify(eqns)

function [T]=transform_syms(a, alpha, d, theta)
T(1,1)=cosd(theta);
T(1,2)=-sind(theta)*cosd(alpha);
T(1,3)=sind(theta)*sind(alpha);
T(1,4)=a*cosd(theta);
T(2,1)=sind(theta);
T(2,2)=cosd(theta)*cosd(alpha);
T(2,3)=-cosd(theta)*sind(alpha);
T(2,4)=a*sind(theta);
T(3,2)=sind(alpha);
T(3,3)=cosd(alpha);
T(3,4)=d;
T(4,4)=1;
end