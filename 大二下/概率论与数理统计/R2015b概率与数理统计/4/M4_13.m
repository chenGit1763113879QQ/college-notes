clear all;
%待检验参数值
theta0=3000;
%显著性水平
alpha=0.1;
%样本容量
n=20;
%加速寿命试验中样品平均失效时间
EoLife=237;
%检验统计量的观测值
x2stat=2*n*(10*EoLife) /theta0
%求拒绝域临界值
c=chi2inv(alpha,2*n)
%检验决策，h=1(0)拒绝（接受）原假设
if x2stat<=c
h=1
else
h=0
end
