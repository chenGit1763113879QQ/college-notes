clear all;
X=normrnd(2,0.5,100,1);  %����100����������
[muhat,sigmahat,muci,sigmaci]=normfit(X,0.01)
