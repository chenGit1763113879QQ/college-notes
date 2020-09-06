clear all;
%设置指数分布的参数
mu=4;
%产生len个随机数
len=5;
y1=exprnd(mu, [1 len])
%产生P行Q列的矩阵
P=3;
Q=4;
y2=exprnd(mu, P,Q)
%显示指数分布的柱状图
M=1000;
y3=exprnd(mu, [1 M]);
figure(1);
t=0:0.2:max(y3);
hist(y3,t);
axis([0 max(y3) 0 100]);
xlabel('取值');ylabel('计数值');
