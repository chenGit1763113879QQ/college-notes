clear all;
%%���ļ�
fid=fopen('data.txt','mb');
%��ȡ����
data=fread(fid,12,'uint8');   %��ȡ12������
d=data.^2;
%{
plot(data,d);
title('ɢ��ͼ');
xlabel('x');
ylabel('y');
%}
%�ر��ļ�
fclose(fid);
