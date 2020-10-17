 clear all;
S = load('reaction');
X = S.reactants;
y = S.rate;
beta0 = S.beta;
%利用nlinfit函数求非线性最小二乘数据拟合
beta = nlinfit(X,y,@hougen,beta0)
