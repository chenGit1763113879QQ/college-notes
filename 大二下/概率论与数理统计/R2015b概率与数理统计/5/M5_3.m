%MATLAB数据处理(1)
clear all;
y=[73 66 89 82 43 80 63 88 78 91 76 85 94 80 96 68 79 71 71 87 68 59 76 80];
r=3;
m1=7;m2=8;m3=9;  %各总体的样本容量
n=m1+m2+m3;
alpha=0.05;
y1=sum(y(1:m1));  %第一种教学方法下学生的成绩之和
y2=sum(y((m1+1):(m1+m2)));  %第二种教学方法下学生成绩之和
y3=sum(y((m1+m2+1):n));  %第三种教学方法下学生的成绩之和
y4=sum(y);  %各学生成绩之和
yy=sum(y.^2);  %各学生成绩平方之和
g=y1^2/m1+y2^2/m2+y3^2/m3;
SST=yy-y4^2/n;  %总的偏差平方和
SSA=g-y4^2/n;  %因子的偏差平方和
SSE=SST-SSA;  %误差平方和
g1=SSA/(r-1);  %偏差平方和
g2=SSE/(n-r);  %误差均方和
FEST=g1/g2;  %由样本计算出的F值
FLJ=finv(1-alpha,r-1,n-r);  %应用MATLAB统计工具箱中finv函数求得临界值
p=1-fcdf(FEST,r-1,n-r);
if FEST>FLJ
    h=1;
else
    h=0;
end
alpha,h,p,FEST,FLJ
