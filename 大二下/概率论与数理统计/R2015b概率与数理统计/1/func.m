function b=func(x,y)
%距离函数
%假如nargin=1,返回x
%假如nargin=2,返回sqrt(x^2+y^2)
if nargin==1
    b=x;
else
    b=sqrt(x.^2+y.^2);
end
