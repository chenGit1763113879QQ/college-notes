clear al;
%生成正态分布数据
M=100;N=1;
x=normrnd(0,1,M,N);
%生成均匀分布
y=rand(M,N);
z=[x,y];
%绘制正态概率图
h=normplot(z);
xlabel('数据');ylabel('概率');
title('正态概率图');
legend('正态分布数据','均匀分布数据');
grid on;
