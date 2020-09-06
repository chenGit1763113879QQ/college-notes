clear all;
rng default;  %设置重复性
y = evrnd(0,3,100,1);
[h,stats]=cdfplot(y)
hold on
x = -20:0.1:10;
f = evcdf(x,0,3);
plot(x,f,'m')
legend('经验分布曲线','理论上分布曲线','Location','NW')
