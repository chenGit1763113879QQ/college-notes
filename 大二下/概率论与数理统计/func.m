function[outvar] = func(x,y,alpha)
%计算正态分布两个总体均值差的置信区间
%   x=[156,465.13,54.80]
%   y=[74,422.16,49.20]
%   sans=[23.47, 62.47]
n1=x(1);xbar=x(2);S1=x(3);
n2=y(1);ybar=y(2);S2=y(3);
t=@(alpha,n)(tinv(1-alpha,n));
sw=@(n1,n2,S1,S2)(sqrt(((n1-1)*S1*S1+(n2-1)*S2*S2)/(n1+n2-2)));
L=@(n1,n2,S1,S2,alpha)(t(alpha/2,n1+n2-2)*sw(n1,n2,S1,S2)*sqrt(1/n1+1/n2));
L2=@(n1,n2,t1,sw1)(t1*sw1*sqrt(1/n1+1/n2));
c=xbar-ybar;
l=L(n1,n2,S1,S2,alpha);

t1=t(alpha/2,n1+n2-2);
t1=round(t1,2);
sw2=sw(n1,n2,S1,S2);
sw1=round(sw2,2);
l2=L2(n1,n2,t1,sw1);
% outvar1=[c,l;c-l,c+l];
% outvar2=[c,l2;c-l2,c+l2];
outvar=[c-l,c+l];
end

