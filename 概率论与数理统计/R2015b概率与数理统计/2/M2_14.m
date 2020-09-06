 clear all;
%设置二项式分布的参数
N=100;
p=0.5;
%产生len个随机数
len=5;
y1=binornd(N,p,[1 len])
%产生P行Q列的矩阵
P=3;
Q=4;
y2=binornd(N,p,P,Q)
%显示二项式分布的柱状图
M=1000;
y3=binornd(N,p,[1 M]);
figure(1);
t=0:2:N;
hist(y3,t);
axis([0 N 0 300]);
xlabel('取值');ylabel('计数值');
