 clear all;
x=[1.1 2.2 3.3 4.4 5.5];
n=length(x);
m=mean(x);
c=2.3/sqrt(n);
d=c*norminv(0.975);
a1=m-d;
b1=m+d;
[a1,b1]
