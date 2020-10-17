clear all;
%定义样本观测值向量
X=[49.4  50.5  50.7  51.7  49.8  47.9  49.2  51.4  48.9];
var0=1.5;                     %原假设中的常数
alpha=0.05;                   %显著性水平为0.05
tail='both';                  %尾部类型为双侧
vartest (X,var0,alpha,tail)
