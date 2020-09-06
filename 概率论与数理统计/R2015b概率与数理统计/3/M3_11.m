clear all;
x=[1.1 2.2 3.3 4.4 5.5];
n=length(x);
c1=chi2inv(0.025,4);
c2=chi2inv(0.975,4);
T=(n-1)*var(x);
a3=T/c2;
b3=T/c1;
[a3,b3]
