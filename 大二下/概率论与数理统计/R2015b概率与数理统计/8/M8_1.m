 clear all;
%产生随机数据
X = mvnrnd([0 0],[1 0.99; 0.99 1],20);         
X(:,3:4) = mvnrnd([0 0],[1 0.99; 0.99 1],20);
X(:,5:6) = mvnrnd([0 0],[1 0.99; 0.99 1],20);
%进行Bartlett维数检验
[ndim, prob,chisquare] = barttest(X,0.05)
