 clear all;
x=[2.23,2.35,2.45,2.55,2.65,2.75,2.85,2.95,3.05,3.15,3.25,3.35,3.45,3.55,3.65,3.75];
f=[3 4 5 11 12 17 19 26 24 22 19 13 13 7 3 2];
n=sum(f);
MU=sum(f.*x)./n
SIGMA=sqrt(sum(f.*(x.^2))./n-MU.^2)


a=[];
for k=1:11
    aa=(x(2+k)+x(3+k))/2;  %小区间边界点取相邻两个数据的中点
    a=[a,aa];
end
a=[-inf,a,inf]'  %由于正态变量在整个数轴上取值,最小边界点的- 最大边界点为+ 


f=[f(1)+f(2)+f(3),f(4:13),f(14)+f(15)+f(16)]'

PEST=[];
for i=1:12
    pp=normcdf(a(i+1),MU,SIGMA)-normcdf(a(i),MU,SIGMA);
    PEST=[PEST,pp];
end
THEF=n*PEST'


 CHI2EST=sum((f-THEF).^2./THEF)
 
 k=12;
r=2;
alpha=0.05;
df=k-r-1;
REFCR=chi2inv(1-alpha,df);  %拒绝域临界值
p=1-chi2cdf(CHI2EST,df);  %检验的p值
if CHI2EST>REFCR
    h=1;
else
    h=0;
end
alpha,h,p
stat=[k,r,CHI2EST,REFCR]
