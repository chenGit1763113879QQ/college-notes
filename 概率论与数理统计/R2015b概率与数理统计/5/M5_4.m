%MATLAB数据处理（2）
clear all;
alpha=0.05;
m1=7;m2=8;m3=9;  %各总体的样本容量
n=m1+m2+m3;
r=3;
t=tinv(1-alpha/2,n-r);
SSE=2.3404e+003;  %引用MATLAB数据处理(1)中结果
LSD12=t*sqrt(SSE/(n-r))*sqrt(1/m1+1/m2);
LSD13=t*sqrt(SSE/(n-r))*sqrt(1/m1+1/m3);
LSD23=t*sqrt(SSE/(n-r))*sqrt(1/m2+1/m3);
MU1=70.8571;  %引用MATLAB数据处理(2)中结果,下同
MU2=86;
MU3=55.1111;
if abs(MU1-MU2)>LSD12
    h(1)=1;
else
    h(1)=0;
end
if abs(MU1-MU3)>=LSD13
    h(2)=1;
else
    h(2)=0;
end
if abs(MU2-MU3)>=LSD23
    h(3)=1;
else
    h(3)=0;
end
h  %结果,依次显示第1和2,1和3,2和3种方法下学生平均成绩差异的显著性
