clear all;
x=[24.3,20.8,23.7,21.3,17.4];
y=[18.2,16.9,20.2,16.7];
%设定显著性水平
alpha=0.05;
%计算检验统计量的观测值
U=(mean(x)-mean(y))/sqrt(7.5/5+2.6/4);
%求拒绝域的临界值
DETA=norminv((1-alpha/2),0,1);
%求拒绝原假设的最小显著性概率
p=1-normcdf(U,0,1);
%决策，拒绝原假设则返回h=1，否则返回h=0
if abs(U)>DETA
h=1;
else
h=0;
end
alpha,h,p,U,DETA
