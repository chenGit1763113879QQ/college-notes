 clear all;
x = (1:10)';
y = 10 - 2*x + randn(10,1);
y(10) = 0;
bls = regress(y,[ones(10,1) x])     %一元线性回归分析
[b,stats] = robustfit(x,y)            %稳键回归分析
scatter(x,y,'filled');          %散点图
grid on; hold on
plot(x,bls(1)+bls(2)*x,'r','LineWidth',2);
plot(x,b(1)+b(2)*x,'g','LineWidth',2)
legend('数据','线性回归','稳健回归')
