function AB_Per_RSSI(data_save_file,interval)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear
% close all
% clc
% 
% 
% file_name = '1_12_2';
% %间隔
% interval    = 0.2;
% %文件
% data_save_file      = [file_name,'/',file_name,'.xlsx'];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

time_a=xlsread(data_save_file,'sheet1','A:A');
per_a=xlsread(data_save_file,'sheet1','H:H');
rssi_a=xlsread(data_save_file,'sheet1','I:I');

time_b=xlsread(data_save_file,'sheet2','A:A');
per_b=xlsread(data_save_file,'sheet2','H:H');
rssi_b=xlsread(data_save_file,'sheet2','I:I');

test_times_a = size(time_a,1);
test_times_b = size(time_b,1);

rssi_times_a = size(rssi_a,1);
rssi_times_b = size(rssi_b,1);

if(test_times_a==rssi_times_a)
    
else
	for i=(rssi_times_a+1):test_times_a
        if(i==test_times_a)
            rssi_a(i)=-99;
        else
            rssi_a(i)=NaN;
        end
	end
end

if(test_times_b==rssi_times_b)
    
else
	for i=(rssi_times_b+1):test_times_b
        if(i==test_times_b)
            rssi_b(i)=-99;
        else
            rssi_b(i)=NaN;
        end
	end
end



if(test_times_a>test_times_b)
    test_times_min  = test_times_b;
    time_min        = time_b;
    rssi_min        = rssi_b;
    test_times_max  = test_times_a;
    time_max        = time_a;
    rssi_max        = rssi_a;
else
    test_times_min  = test_times_a;
    time_min        = time_a;
    rssi_min        = rssi_a;
    test_times_max  = test_times_b;
    time_max        = time_b;
    rssi_max        = rssi_b;
end



i = fix(test_times_min-5000);
k=1;
while(k&(i<=test_times_max))
    if(rssi_max(i)<-80)
        off_time_max = (i*interval/60);
        k=0;
    end
    i=i+1;
end

off_time_min = off_time_max-3;
off_time_max = off_time_min+11;




figure();
subplot(1,2,1),semilogy(time_a,rssi_a,'m'),hold on,semilogy(time_b,rssi_b,'blue'),axis([off_time_min off_time_max,-100,0]),title('RSSI'),xlabel('时间（min）'),ylabel('功率（dBm）'),set(gca,'FontSize',14),legend('设备A','设备B'); 
subplot(1,2,2),plot(time_a,per_a,'m'),hold on,plot(time_b,per_b,'blue'),axis([off_time_min off_time_max,0,100]),title('丢包率'),xlabel('时间（min）'),ylabel('百分比（%）'),set(gca,'FontSize',14),legend('设备A','设备B');

    
sgtitle('A、B模块丢包率与RSSI','FontSize',20);
end
