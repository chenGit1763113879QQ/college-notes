 clear all;
load carsmall   %��������
%��ʾ����
whos
%��ʾ����
x=[MPG Horsepower Displacement Weight];
gplotmatrix(x,[],Model_Year,[],'+xo')
%��Ԫ�������
[d,p]=manova1(x,Model_Year)
