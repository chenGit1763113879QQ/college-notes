%MATLAB数据处理（3）
clear all;
y=[73 66 89 82 43 80 63 88 78 91 76 85 94 80 96 68 79 71 71 87 68 59 76 80];
alpha=0.05;
m1=7;m2=8;m3=9;
n=m1+m2+m3;
r=3;
fE=n-r;
y_1=496;   %引用MATLAB数据处理（1）中的结果，下同
y_2=688;
y_3=659;
mu1=y_1/m1  %第一种教学方法下学生平均英语成绩的点估计
mu2=y_2/m2  %第二种教学方法下学生平均英语成绩的点估计
mu3=y_3/m3  %第三种教学方法下学生平均英语成绩的点估计
T=tinv(1-alpha/2,fE);
Se=2.3404e+003;  %引用MATLAB数据处理（1）中结果
sigma=sqrt(Se/(n-r));  %英语成绩标准差的无偏估计
a=[mu1-T*sigma/sqrt(m1),mu1+T*sigma/sqrt(m1)];
b=[mu2-T*sigma/sqrt(m2),mu2+T*sigma/sqrt(m2)];
c=[mu3-T*sigma/sqrt(m3),mu3+T*sigma/sqrt(m3)];
a,b,c                 %三种教学方法下平均英语成绩的置信区间
