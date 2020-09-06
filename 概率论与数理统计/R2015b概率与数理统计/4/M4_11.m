clear all;
%检验统计量的观测值
T=1;
%显著性水平
alpha=0.05;
%为确定拒绝域临界值计算 的概率
p=1-binocdf(0:15,15,0.01);
%求拒绝域临界值
for byk=1:16
if p(byk)>alpha&p(byk+1)<=alpha
c=byk;
end
end
%检验决策，h=1(0)拒绝（接受）原假设
if T>=c
h=1
else
h=0
end
