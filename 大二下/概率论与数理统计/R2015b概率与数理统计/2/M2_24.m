 clear all;
x=normrnd(0,1,100,100);
s=std(x);
s_iqr=0.7413*iqr(x);
eff=(norm(s-1)./norm(s_iqr-1)).^2
