% 用于计算补码
% 参数x：原始十六进制值
% 参数N：位数
% 输出值c：转换得到十进制


function [c] = Complement(x, N)
% clear
% close all
% clc
%     x = 65462;
%     N = 16;
    
    %x_dec = hex2dec(x)
    x_bin = dec2bin(x);
    
    l = length(x_bin);
    
    if(l<N)
        c = x;
    else
        source(1)='0';
        for k=2:N
            if(x_bin(k)=='1')
                source(k) = '0';
            else
                source(k) = '1';
            end
        end
        c = -bin2dec(source)+1;
    end
end