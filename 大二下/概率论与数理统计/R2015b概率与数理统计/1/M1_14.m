clear all;
%%打开文件
fid=fopen('data.txt','mb');
%读取内容
data=fread(fid,12,'uint8');   %读取12个数据
d=data.^2;
%{
plot(data,d);
title('散点图');
xlabel('x');
ylabel('y');
%}
%关闭文件
fclose(fid);
