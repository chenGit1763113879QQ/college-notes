 clear all;
% 产生正态分布的样本
% 样本长度
N=1024;
x1=normrnd(5,1,N,1);
x2=normrnd(6,1,N,1);
x=[x1 x2];
%参数
figure(1);
sym1='*';
notch1=1;  %凹口
boxplot(x,notch1,sym1);
figure(2);
notch2=0;  %矩形
boxplot(x,notch2);
figure(3);
vert=0;  %水平
boxplot(x,notch1,'+',vert);
