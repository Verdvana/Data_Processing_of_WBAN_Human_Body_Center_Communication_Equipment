clear
close all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%次数
% test_times_a=23628;
% test_times_b=24036;%12_23
% 
% test_times_a=36000;
% test_times_b=42000;%12_24
% 
% test_times_a=54398;
% test_times_b=54551;%12_24_2
% 
% test_times_a=55759;
% test_times_b=55821;%12_25_1
%
% test_times_a=52329;
% test_times_b=56000;%12_25_2
%
% test_times_a=58265;
% test_times_b=58275;%12_26_1
%
% test_times_a=48822;%49310;
% test_times_b=58275;%12_27_1
%
% test_times_a=54089;
% test_times_b=62000;%12_27_2
%
% test_times_a=54089;
% test_times_b=62000;%12_28_1
%
% test_times_a=52933;
% test_times_b=62632;%12_28_2
%
% test_times_a=54463;
% test_times_b=70000;%12_29_1
%
% test_times_a=53029;
% test_times_b=65000;%12_30_1
%
% test_times_a=51109;
% test_times_b=64709;%1_2_1
%
% test_times_a=51412;
% test_times_b=84709;%1_3_1
%
% test_times_a=47167;
% test_times_b=59040;%1_4_1
%
% test_times_a=53164;
% test_times_b=59959;%1_4_2
%
% test_times_a=52561;
% test_times_b=63717;%1_5_1
%
% test_times_a=47642;
% test_times_b=54919;%1_6_1
%
% test_times_a=52164;
% test_times_b=61887;%1_6_2
%
% test_times_a=51063;
% test_times_b=57808;%1_7_1
%
% test_times_a=53372;
% test_times_b=62472;%1_7_2
%
% test_times_a=48804;%49404;
% test_times_b=58200;%1_8_1
%
% test_times_a=52877;
% test_times_b=61274;%1_8_2
%
% test_times_a=47402;
% test_times_b=56189;%1_9_1
%
% test_times_a=52094;
% test_times_b=61554;%1_9_2
%
% test_times_a=52041;
% test_times_b=61223;%1_9_3
%
% test_times_a=51894;
% test_times_b=62342;%1_10_1
%
% test_times_a=52550;
% test_times_b=59200;%1_10_2
%
% test_times_a=17633;
% test_times_b=20834;%1_11_1
%
% test_times_a=31998;
% test_times_b=37313;%1_11_2
%
% test_times_a=152975;
% test_times_b=182735;%1_12_1
%
% test_times_a=55784;
% test_times_b=54123;%1_12_2
%
% test_times_a=141981;
% test_times_b=165468;%1_13_1
%
% test_times_a=134376;
% test_times_b=158148;%1_14_1
%
% test_times_a=51153;
% test_times_b=60496;%1_14_2
%
% test_times_a=51910;
% test_times_b=61941;%1_15_1
%
% test_times_a=51348;
% test_times_b=61733;%1_15_1
%
% test_times_a=43411;
% test_times_b=51488;%1_19_1
%
test_times_a=41304;
test_times_b=47894;%1_20_1

file_name = '1_20_1';

%间隔
interval    = 0.2;

%文件
original_file_a  = [file_name,'/A.dat'];
original_file_b  = [file_name,'/B.dat'];
data_save_file      = [file_name,'/',file_name,'.xlsx'];

design_cap = '100mah';
full_voltage_a = '4.22V';
full_voltage_b = '4.21V';
empty_voltage_a = '3.00V';
empty_voltage_b = '2.98V';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[xstart,xend] = Data_Process(test_times_a,test_times_b,interval,original_file_a,original_file_b,data_save_file);

Data_Output(data_save_file,xstart,xend,design_cap,full_voltage_a,full_voltage_b,empty_voltage_a,empty_voltage_b);


% Vol_Per_RSSI(data_save_file,'A',interval);
% Vol_Per_RSSI(data_save_file,'B',interval);

AB_Per_RSSI(data_save_file,interval);

