 %MATLAB数据处理(4)
clear all;
y=[73 66 89 82 43 80 63 88 78 91 76 85 94 80 96 68 79 71 71 87 68 59 76 80];
alpha=0.05;
m1=7;m2=8;m3=9;  %各总体的样本容量
n=m1+m2+m3;
r=3;
SSE=2.3404e+003;  %引用MATLAB数据处理(1)中结果
n=m1+m2+m3;
fE=n-r;
c=(1/(m1-1)+1/(m2-1)+1/(m3-1)-1/fE)/(3*(r-1))+1;
s1=var(y(1:m1));
s2=var(y((m1+1):(m1+m2)));
s3=var(y((n-m3+1):n));
chi2EST=(fE*log(SSE/fE)-(m1-1)*log(s1)-(m2-1)*log(s2)-(m3-1)*log(s3))/c;
LJZ=chi2cdf(1-alpha,r-1);
p=1-chi2cdf(chi2EST,r-1);
if chi2EST>LJZ
    h=1;
else
    h=0;
end
alpha,h,p,chi2EST,LJZ
