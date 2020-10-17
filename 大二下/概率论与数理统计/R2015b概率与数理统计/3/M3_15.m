clear all;
%用函数句柄表示模型
modelfun = @(b,x)(b(1)+b(2)*exp(-b(3)*x));
rng('default') % 可重复性
b = [1;3;2];
x = exprnd(2,100,1);
y = modelfun(b,x) + normrnd(0,0.5,100,1);
%适合非线性模型，采用连接选项
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
[beta,R,J,CovB,MSE] = nlinfit(x,y,modelfun,beta0,opts);
%画出在95%的置信区间的拟合回归模型
xrange = min(x):.01:max(x);
[ypred,delta] = nlpredci(modelfun,xrange,beta,R,'Covar',CovB,...
                         'MSE',MSE,'SimOpt','on');
lower = ypred - delta;   %下界
upper = ypred + delta;   %上界
plot(x,y,'ko') %观测数据
hold on
plot(xrange,ypred,'k','LineWidth',2);
plot(xrange,[lower;upper],'r--','LineWidth',1.5);
legend('原始数据','拟合回归模型数据','在95%的置信区间的拟合回归模型');
