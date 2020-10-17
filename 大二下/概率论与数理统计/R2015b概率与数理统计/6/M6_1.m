clear al;
p = [1 -2 -1 0];
t = 0:0.1:3;
y = polyval(p,t) + 0.5*randn(size(t));
plot(t,y,'ro')
h = refcurve(p);        %对数据进行回归
set(h,'Color','r')
q = polyfit(t,y,3);       %对拟合多项式进行回归
refcurve(q)
legend('原始数据','数据回归','一次线性回归','Location','NW');
xlabel('样本数据');ylabel('效果图');
