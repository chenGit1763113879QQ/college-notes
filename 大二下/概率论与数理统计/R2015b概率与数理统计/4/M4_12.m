clear all;
%粒子数数据
A=[0,1,2,3,4];
%频数数据
N=[4,7,2,1,1];
%检验统计量的观测值
T=N*A'
%显著性水平
alpha=0.1;
%样本容量
n=sum(N);
%待检验分数值
lambda0=0.6;
%求拒绝域临界值
c=0.5*chi2inv(1-alpha,2*n*lambda0)
%检验决策，h=1(0)拒绝（接受）原假设
if T>=c
h=1
else
h=0
end
