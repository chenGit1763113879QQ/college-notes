function b=func(x,y)
%���뺯��
%����nargin=1,����x
%����nargin=2,����sqrt(x^2+y^2)
if nargin==1
    b=x;
else
    b=sqrt(x.^2+y.^2);
end
