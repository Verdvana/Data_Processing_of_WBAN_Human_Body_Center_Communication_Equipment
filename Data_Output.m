function Data_Output(data_save_file,xstart,xend,design_cap,full_vol_a,full_vol_b,empty_vol_a,empty_vol_b)



%题目
A_title = ['设备A(',design_cap,') ',full_vol_a,'/',empty_vol_a];
B_title = ['设备B(',design_cap,') ',full_vol_b,'/',empty_vol_b];

time_a=xlsread(data_save_file,'sheet1','A:A');
cap_a=xlsread(data_save_file,'sheet1','B:B');
health_a=xlsread(data_save_file,'sheet1','C:C');
tem_a=xlsread(data_save_file,'sheet1','D:D');
res_a=xlsread(data_save_file,'sheet1','E:E');
vol_a=xlsread(data_save_file,'sheet1','F:F');
cur_a=xlsread(data_save_file,'sheet1','G:G');
per_a=xlsread(data_save_file,'sheet1','H:H');
rssi_a=xlsread(data_save_file,'sheet1','I:I');

time_b=xlsread(data_save_file,'sheet2','A:A');
cap_b=xlsread(data_save_file,'sheet2','B:B');
health_b=xlsread(data_save_file,'sheet2','C:C');
tem_b=xlsread(data_save_file,'sheet2','D:D');
res_b=xlsread(data_save_file,'sheet2','E:E');
vol_b=xlsread(data_save_file,'sheet2','F:F');
cur_b=xlsread(data_save_file,'sheet2','G:G');
per_b=xlsread(data_save_file,'sheet2','H:H');
rssi_b=xlsread(data_save_file,'sheet2','I:I');

test_times_a = size(time_a);
rssi_times_a = size(rssi_a);

if(test_times_a==rssi_times_a)

else
    for k=(rssi_times_a+1):(test_times_a-1)
        rssi_a(k) = NaN;
    end
    rssi_a(test_times_a) = -99;
end




figure();
subplot(2,4,1),plot(time_a,cap_a),axis([xstart xend,0,100]),title('剩余容量'),xlabel('时间（min）'),ylabel('百分比（%）'),set(gca,'FontSize',14),grid on;
subplot(2,4,2),plot(time_a,health_a),axis([xstart xend,50,110]),title('电池健康度'),xlabel('时间（min）'),ylabel('百分比（%）'),set(gca,'FontSize',14),grid on;
subplot(2,4,3),plot(time_a,tem_a),axis([xstart xend,0,30]),title('电池温度'),xlabel('时间（min）'),ylabel('温度（℃）'),set(gca,'FontSize',14),grid on;
subplot(2,4,4),plot(time_a,res_a),axis([xstart xend,0,1]),title('电池内阻'),xlabel('时间（min）'),ylabel('阻值（Ω）'),set(gca,'FontSize',14),grid on;
subplot(2,4,5),plot(time_a,vol_a),axis([xstart xend,0,4.5]),title('电池电压'),xlabel('时间（min）'),ylabel('电压值（V）'),set(gca,'FontSize',14),grid on;
subplot(2,4,6),plot(time_a,cur_a),axis([xstart xend,0,300]),title('电池电流'),xlabel('时间（min）'),ylabel('电流值（mA）'),set(gca,'FontSize',14),grid on;
subplot(2,4,7),plot(time_a,per_a),axis([xstart xend,0,100]),title('丢包率'),xlabel('时间（min）'),ylabel('百分比（%）'),set(gca,'FontSize',14),grid on;
subplot(2,4,8),plot(time_a,rssi_a),axis([xstart xend,-80,-10]),title('RSSI'),xlabel('时间（min）'),ylabel('功率（dBm）'),set(gca,'FontSize',14),grid on;
sgtitle(A_title,'FontSize',20);


figure();
subplot(2,4,1),plot(time_b,cap_b),axis([xstart xend,0,100]),title('剩余容量'),xlabel('时间（min）'),ylabel('百分比（%）'),set(gca,'FontSize',14),grid on;
subplot(2,4,2),plot(time_b,health_b),axis([xstart xend,50,110]),title('电池健康度'),xlabel('时间（min）'),ylabel('百分比（%）'),set(gca,'FontSize',14),grid on;
subplot(2,4,3),plot(time_b,tem_b),axis([xstart xend,0,30]),title('电池温度'),xlabel('时间（min）'),ylabel('温度（℃）'),set(gca,'FontSize',14),grid on;
subplot(2,4,4),plot(time_b,res_b),axis([xstart xend,0,1]),title('电池内阻'),xlabel('时间（min）'),ylabel('阻值（Ω）'),set(gca,'FontSize',14),grid on;
subplot(2,4,5),plot(time_b,vol_b),axis([xstart xend,0,4.5]),title('电池电压'),xlabel('时间（min）'),ylabel('电压值（V）'),set(gca,'FontSize',14),grid on;
subplot(2,4,6),plot(time_b,cur_b),axis([xstart xend,0,300]),title('电池电流'),xlabel('时间（min）'),ylabel('电流值（mA）'),set(gca,'FontSize',14),grid on;
subplot(2,4,7),plot(time_b,per_b),axis([xstart xend,0,100]),title('丢包率'),xlabel('时间（min）'),ylabel('百分比（%）'),set(gca,'FontSize',14),grid on;
subplot(2,4,8),plot(time_b,rssi_b),axis([xstart xend,-80,-10]),title('RSSI'),xlabel('时间（min）'),ylabel('功率（dBm）'),set(gca,'FontSize',14),grid on;
sgtitle(B_title,'FontSize',20);
grid on;

end