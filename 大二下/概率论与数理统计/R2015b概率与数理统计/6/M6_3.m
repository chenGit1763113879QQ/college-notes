 clear all;
x=[1617	1532 1762	1405	1578	1611	1650	1497	1532	1689];
y=[435	366	504	290	382	426	460	300	392	473];
X=[ones(size(x,2),1),x'];
[b,bint,r,rint,stats]=regress(y',X)   %一元线性回归分析
z=b(1)+b(2)*x;
plot(x,y,'o',x,z,'r');        %回归模型图
ylabel('产量(y)');xlabel('积温(x)')
legend('散点','回归线性模型');
