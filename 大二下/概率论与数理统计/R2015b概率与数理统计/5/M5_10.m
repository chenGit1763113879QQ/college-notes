 clear all;
load carsmall   %载入数据
%显示数据
whos
%显示变量
x=[MPG Horsepower Displacement Weight];
gplotmatrix(x,[],Model_Year,[],'+xo')
%多元方差分析
[d,p]=manova1(x,Model_Year)
