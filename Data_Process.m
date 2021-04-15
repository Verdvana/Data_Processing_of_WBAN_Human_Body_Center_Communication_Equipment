function [xstart,xend] = Data_Process(test_times_a,test_times_b,interval,original_file_a,original_file_b,data_save_file)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear
% close all
% clc
% test_times_a=152975;
% test_times_b=182735;%1_12_1
% 
% 
% file_name = '1_12_1';
% 
% %间隔
% interval    = 0.2;
% 
% %文件
% original_file_a  = [file_name,'/A.dat'];
% original_file_b  = [file_name,'/B.dat'];
% data_save_file      = [file_name,'/',file_name,'.xlsx'];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%横坐标范围
xstart = 0;
if(test_times_a > test_times_b)
    test_time_max = test_times_a;
else
    test_time_max = test_times_b;
end
xend = (test_time_max*1.1)*interval/60;

%矩阵大小定义

%测试次数
m_a=test_times_a;
m_b=test_times_b;
%测试项目个数
n=29;
%测量间隔（s）
p=interval;

%读取数据文件并变为矩阵
fid=fopen(original_file_a);
data_original_a=fread(fid,[29,test_times_a]);
fclose(fid);

fid=fopen(original_file_b);
data_original_b=fread(fid,[29,test_times_b]);
fclose(fid);

data_original_a = data_original_a';
data_original_b = data_original_b';

%去掉校验位
parfor i=1:m_a
    for j=1:n
        if(data_original_a(i,j)==0)
            data_a{i,j}='';
        else
            data_a{i,j}=dec2hex(data_original_a(i,j)-80);
        end
    end
end

parfor i=1:m_b
    for j=1:n
        if(data_original_b(i,j)==0)
            data_b{i,j}='';
        else
            data_b{i,j}=dec2hex(data_original_b(i,j)-160);
        end
    end
end



%十六进制拼接
for i=1:m_a
    data_cap_a(i)      = cellstr(cell2mat(data_a(i,1:4)));
    data_health_a(i)   = cellstr(cell2mat(data_a(i,5:8)));
    data_health_a(i)   = cellstr(cell2mat(data_a(i,5:8)));
    data_tem_a(i)      = cellstr(cell2mat(data_a(i,9:12)));
    data_res_a(i)      = cellstr(cell2mat(data_a(i,13:16)));
    data_vol_a(i)      = cellstr(cell2mat(data_a(i,17:20)));
    data_cur_a(i)      = cellstr(cell2mat(data_a(i,21:24)));
    data_per_a(i)      = cellstr(cell2mat(data_a(i,25:27)));
    data_rssi_a(i)     = cellstr(cell2mat(data_a(i,28:29)));
end


for i=1:m_b
    data_cap_b(i)      = cellstr(cell2mat(data_b(i,1:4)));
    data_health_b(i)   = cellstr(cell2mat(data_b(i,5:8)));
    data_tem_b(i)      = cellstr(cell2mat(data_b(i,9:12)));
    data_res_b(i)      = cellstr(cell2mat(data_b(i,13:16)));
    data_vol_b(i)      = cellstr(cell2mat(data_b(i,17:20)));
    data_cur_b(i)      = cellstr(cell2mat(data_b(i,21:24)));
    data_per_b(i)      = cellstr(cell2mat(data_b(i,25:27)));
    data_rssi_b(i)     = cellstr(cell2mat(data_b(i,28:29)));
end


cur_a_dec = hex2dec(data_cur_a);
cur_b_dec = hex2dec(data_cur_b);

%转换为实际值
cap_a       = hex2dec(data_cap_a)/256;
health_a    = hex2dec(data_health_a)/256;
tem_a       = hex2dec(data_tem_a)/256;
res_a       = hex2dec(data_res_a)/4096;
vol_a       = hex2dec(data_vol_a)*1.25/16/1000;
parfor i=1:m_a
    cur_a_pre(i) = -(Complement(cur_a_dec(i), 16)) * 0.15625;
end
cur_a = Window_Avg(cur_a_pre);
%num_a       = str2double(data_num_a);
per_a       = str2double(data_per_a);
rssi_a      = -str2double(data_rssi_a);

for i=1:m_a
    if(isempty(data_cap_a{i}))
        cap_a(i)    = NaN;
        health_a(i) = NaN;
        tem_a(i)    = NaN;
        res_a(i)    = NaN;
        vol_a(i)    = NaN;
        cur_a(i)    = NaN;
        per_a(i)    = NaN;
        rssi_a(i)   = NaN;
    end
end
for i=1:m_a
    if(rssi_a(i)>-20)
        rssi_a(i)   = NaN;
    else
        rssi_a(i)   = rssi_a(i);
    end
end

cap_b       = hex2dec(data_cap_b)/256;
health_b    = hex2dec(data_health_b)/256;
tem_b       = hex2dec(data_tem_b)/256;
res_b       = hex2dec(data_res_b)/4096;
vol_b       = hex2dec(data_vol_b)*1.25/16/1000;
parfor i=1:m_b
    cur_b_pre(i) = -(Complement(cur_b_dec(i), 16)) * 0.15625;
end
cur_b = Window_Avg(cur_b_pre);
%num_b       = str2double(data_num_b);
per_b       = str2double(data_per_b);
rssi_b      = -str2double(data_rssi_b);

for i=1:m_b
    if(isempty(data_cap_b{i}))
        cap_b(i)    = NaN;
        health_b(i) = NaN;
        tem_b(i)    = NaN;
        res_b(i)    = NaN;
        vol_b(i)    = NaN;
        cur_b(i)    = NaN;
        per_b(i)    = NaN;
        rssi_b(i)   = NaN;
    end
end
for i=1:m_b
    if(rssi_b(i)>-20)
        rssi_b(i)   = NaN;
    else
        rssi_b(i)   = rssi_b(i);
    end
end


time_a=1:m_a;
parfor k=1:m_a
    time_a(k)=(time_a(k)-1)*p/60;
end
time_b=1:m_b;
parfor k=1:m_b
    time_b(k)=(time_b(k)-1)*p/60;
end

delete(data_save_file);

xlswrite(data_save_file,time_a','sheet1','A1');
xlswrite(data_save_file,cap_a,'sheet1','B1');
xlswrite(data_save_file,health_a,'sheet1','C1');
xlswrite(data_save_file,tem_a,'sheet1','D1');
xlswrite(data_save_file,res_a,'sheet1','E1');
xlswrite(data_save_file,vol_a,'sheet1','F1');
xlswrite(data_save_file,cur_a','sheet1','G1');
xlswrite(data_save_file,per_a','sheet1','H1');
xlswrite(data_save_file,rssi_a','sheet1','I1');


xlswrite(data_save_file,time_b','sheet2','A1');
xlswrite(data_save_file,cap_b,'sheet2','B1');
xlswrite(data_save_file,health_b,'sheet2','C1');
xlswrite(data_save_file,tem_b,'sheet2','D1');
xlswrite(data_save_file,res_b,'sheet2','E1');
xlswrite(data_save_file,vol_b,'sheet2','F1');
xlswrite(data_save_file,cur_b','sheet2','G1');
xlswrite(data_save_file,per_b','sheet2','H1');
xlswrite(data_save_file,rssi_b','sheet2','I1');

end