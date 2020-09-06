
# 概率论与数理统计及其matlab实现

## 说明

本内容是我看化学工业出版社的《概率论与数理统计及其MATLAB实现》的笔记
内容不可避免不全，或者侵权，请联系删除# 排列、组合及概率计算的MATLAB实现

## 1-排列组合及概率计算的MATLAB实现
<!--对应 第一章随机事件及其概率的第七节-->

|函数名|调用格式|注释|
|------|------|----|
|组合数|nchoose(n,k)|组合数$C_n^k$|
|排列数|factorial(n)|排列数n！|
计算排列数$A_n^k$可以使用`nchoosek(n,k)*factorial(k)`

```matlab
% 使用matlab验证概率的频率定义
for i=1:6
a(i)=sum(round(rand(1,10^i)))/10^i;
end
```

```matlab
%N*m^2为实验的总次数
N=100000;%进行多少次循环
m=1;%m^2为每次循环进行的试验次数
t=0;p=zeros(1,N);
for i=1:N
a=round(rand(m)-0.2);%一百次试验0.3的概率为1，0.7的概率为0
t=t+mean(a(:));
p(i)=t/i;
end
hold on
plot(p(10:end));
plot(0.3*ones(1,N))
```

## 2-几种常见分布的matlab实现
<!--对应第二章 随机变量及其分布的第七节-->
- pdf 密度函数f(x)
- cdf 分布函数P=F(x)
- inv 逆累积分布函数$F^{-1}(y)$
- 上分位点，可以通过inv实现，如对于t分布`t=@(alpha,n)(tinv(1-alpha,n));`
- 下分位点即为你累计分布函数

### 离散型随机变量的分布

|分布类型|密度函数|累积分布函数|逆累积分布函数|注释|
|-------|--------|------------|-----------|-----|
|二项分布|binopdf(X,N,P)|binocdf(X,N,P)|binoinv(Y,N,P)|X为随机变量，Y为显著概率值，N为独立试验的次数，P为事件发生的概率|
|泊松分布|poisspdf(X,LMD)|poisscdf(X,LMD)|poissinv(X,LMD)|X为随机变量，Y为显著概率值，LMD为参数$\lambda$|

### 连续型随机变量的分布

|分布类型|密度函数|累积分布函数|逆累积分布函数|注释|
|-------|--------|------------|-----------|-----|
|均匀分布|unifpdf(X,A,B)|unifcdf(X,A,B)|unifinv(P,A,B)|$X\sim U(A,B)$|
|指数分布|exppdf(X,L)|expcdf(X,L)|expinv(P,L)|$X\sim E(X)$|
|正态分布|normpdf(X,M,C)|normcdf(X,M,C)|norminv(P,M,C)|$X\sim N(M,C)$|

## 3-二维随机变量及其分布的MATLAB实现
<!--来源于第三章 第七节 多为随机变量及其分布-->
|函数名|调用格式|注释|
|------|-------|-----|
|二维正态分布随机变量密度函数|mvnpdf(x,mu,sigma)|输出均值为mu、协方差矩阵为sigma的正态分布函数在x处的值|

## 几种常见分布数字特征的MATLAB实现
<!--来源于 第四章 第五节 随机变量的数字特征-->
返回值[M,V]中M表示期望，N表示方差

|分布函数|调用形式|注释|
-----|-----|-----
|均匀分布|[M,V]=unifstat(a,b)|指的是连续型均匀分布|
|二项分布|[M,V]=binostat(N,P)||
|指数分布|[M,V]=expstat(N,P)||
|泊松分布|[M,V]=poisstat(LMD)||
|正态分布|[M,V]=normstat(mu,siga)||
|卡方分布|[M,V]=chi2stat(N)||
|t-分布|[M,V]=tstat(N)||
|F-分布|[M,V]=fstat(n1,n2)||
|几何分布|[M,V]=geostat(p)||
|超几何分布|[M,V]=bygestst(N,M,K)||
<!--第四章 大数定理及中心极限定理 没有matlab的相关内容-->
## 6-样本的数字特征及常见分布随机数生成的MATLAB实现
<!--来源于 第六章 数理统计基本概念 第四节 -->
### 样本的数字特征

|函数名|调用格式|注释|
|---|---|---|
|算数平均数|mean(X)|$\bar{x}$|
|无偏估计方差|var(X)|$s^2=\frac 1 {n-1} \sum\limits_{i=1}^{n}(x_i-\bar{x})^2$|
|有效估计方差|var(X,1)|$\frac 1 n \sum\limits_{i=1}^{n}(x_i-\bar{x})^2$|
|无偏估计标准差|std(X)|
|有效估计标准差|std(X,1)|
|协方差|cov(X)\cov(X,Y)|
|相关系数|corrcoef(X,Y)|

### 产生随机分布数

如unifrnd(A,B,m,n)为产生[A,B]上的均匀分布（连续分布）随机数，返回m*n矩阵

分布函数|调用形式|说明
-----|-----|-----
|均匀分布|unifrnd(A,B,m,n)|
|指数分布|exprnd(lambda,m,n)|
|泊松分布|poissrnd(lambda,m,n)|
|正态分布|normrnd(MU,sigma,m,n)
|卡方分布|chi2rnd(N,m,n)|
|t-分布|trnd(N,m,n)|
|F-分布|frnd(N1,N2,m,n)|
|几何分布|geornd(P,m,n)|
|超几何分布|bygernd(N,M,K,m,n)|

## 几种常见分布的**最大似然估计**的MATLAB实现
<!--来源第七章参数估计 第六节-->
|分布名|调用形式|注释|
|---|-----|----|
|正态分布|[mubar,sigmahat,muci,sigmaci]=normfit(X,alpha)|muhat和sigmahat分别为正态分布的均值和方差的估计值，muci，sigmaci分别为$\mu,\sigma$的置信区间，其置信度为$(1-\alpha)\times100\%$,alpha为显著水平，缺省时默认为0.05（即置信度95%），X为样本|
|二项分布|[PHAT,PCI]=binofit(X,N,alpha)|
|泊松分布|[lambdahat,lambdaci]=poissfit(X,alpha)|
|均匀分布|[ahat,bhat,ACI,BAI]=unifit(X,alpha)|
|指数分布|[muhat,muci]=expfit(X,alpha)|

## 假设检验的matlab实现

- h 检验结果，为1表示拒绝假设，为0表示接受假设
- p 观察值得概率

|检验方法|函数介绍|调用形式|注释|
|-------|----|------|--------|
|Z检验|方差已知，单个正态总体的均值$\mu$的假设检验| `[h,p,ci,zval]=ztest(x,m,sigma,alpha,tail)`|x为正态总体的样本，m为均值，sigma为标准差，显著性水平默认为0.05，|
|t检验|方差未知，单个正态总体的均值的假设检验|`[h,sig,c]=ttest(x,M,alpha,tail)`
|t检验|两个正态总体方差未知，但是方差相等时，比较两个正态总体均值的假设检验|`[h,sig,c]=ttest2(x,y,alpha,tail)`
|$\chi ^2$检验|总体均值未知时的单个正态总体方差的检验|`[h,p,varci,stats]=vartest(x,var0,alpha,tail)`
|F检验|总体均值未知时的两个正态中体方差的比|`[h,p,varci,stats]=vartest2(X,Y,alpha,tail)`