clear all;
X=normrnd(2,0.5,100,1);  %产生100个样本数据
[muhat,sigmahat,muci,sigmaci]=normfit(X,0.01)
