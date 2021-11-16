function [th_1_path, th_2_path, th_3_path] = path_cal(th_1, th_2, th_3, count)
global th_1_initial th_2_initial th_3_initial th_1_final th_2_final th_3_final
if count == 1
    th_1_initial = 0;
    th_2_initial = 0;
    th_3_initial = 0; 
end

th_1_final = th_1;
th_2_final = th_2;
th_3_final = th_3;

t = 5;
v1 = (th_1_final - th_1_initial)/t;
v2 = (th_2_final - th_2_initial)/t;
v3 = (th_3_final - th_3_initial)/t;

i = 0:0.01:5;
th_1_path = th_1_initial + v1*i;
th_2_path = th_2_initial + v2*i;
th_3_path = th_3_initial + v3*i;

th_1_initial = th_1;
th_2_initial = th_2;
th_3_initial = th_3;
end
   