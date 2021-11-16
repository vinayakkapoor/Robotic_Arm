function [T]=transform(a, alpha, d, theta)
T=zeros(4,4);
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

