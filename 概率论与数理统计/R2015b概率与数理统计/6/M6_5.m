 clear all;
% 数据的输入
x1=0.1:0.01:0.18;
x2=[x1 0.2 0.21 0.23]';
y=[42.0	41.5	45.0	45.5	45.0	47.2	49.0	55.0	50.3	55.0	55.5	60.5]';
x=[ones(12,1),x2];
% 作数据的散点图
plot(x2,y,'rp');
% 回归分析
[b,bint,r,rint,stats]=regress(y,x);
b,bint,stats
% 作残差分析图
rcoplot(r,rint);
title('残差图的绘制');
xlabel('数据'); ylabel('残差');
% 预测及作回归线图
z=b(1)+b(2)*x2;
figure;
plot(x2,y,'rp',x2,z,'b');
