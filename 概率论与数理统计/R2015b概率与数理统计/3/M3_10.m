clear all;
x=[1.1 2.2 3.3 4.4 5.5];
n=length(x);
m=mean(x);
S=std(x);
dd=S*tinv(0.975,4)/sqrt(n);
a2=m-dd;
b2=m+dd;
[a2,b2]
