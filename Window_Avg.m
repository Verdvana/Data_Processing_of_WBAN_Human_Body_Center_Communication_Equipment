% 计算窗口平均数
% 窗口宽度为10

function [x_avg] = Window_Avg(x)

% clear
% close all
% clc
% 
% x = [1,67,34,-8,6,34,-8,7,21,5,8,-9,12,4,7,9,3,1,-11];
test_times = size(x,2);

for i=1:test_times
    if(i==test_times-10+2)
        x_avg(i) =  (x(i)+x(i+1)+x(i+2)+x(i+3)+x(i+4)+x(i+5)+x(i+6)+x(i+7)+x(i+8))/9;
    elseif(i==test_times-10+3)
        x_avg(i) =  (x(i)+x(i+1)+x(i+2)+x(i+3)+x(i+4)+x(i+5)+x(i+6)+x(i+7))/8;
    elseif(i==test_times-10+4)
        x_avg(i) =  (x(i)+x(i+1)+x(i+2)+x(i+3)+x(i+4)+x(i+5)+x(i+6))/7;
    elseif(i==test_times-10+5)
        x_avg(i) =  (x(i)+x(i+1)+x(i+2)+x(i+3)+x(i+4)+x(i+5))/6;
    elseif(i==test_times-10+6)
        x_avg(i) =  (x(i)+x(i+1)+x(i+2)+x(i+3)+x(i+4))/5;
    elseif(i==test_times-10+7)
        x_avg(i) =  (x(i)+x(i+1)+x(i+2)+x(i+3))/4;
    elseif(i==test_times-10+8)
        x_avg(i) = (x(i)+x(i+1)+x(i+2))/3;
    elseif(i==test_times-10+9)
        x_avg(i) = (x(i)+x(i+1))/2;
    elseif(i==test_times-10+10)
        x_avg(i) = x(i);
    else
        x_avg(i) =  (x(i)+x(i+1)+x(i+2)+x(i+3)+x(i+4))/5;
    end
end
end