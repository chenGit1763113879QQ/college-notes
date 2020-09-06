clear all;
x=[3 4 5;3.5 4.0 4.5;3.0 5.0 7.0];
t=[1.00 0.5 0.00]';
z=x'*x;
[v,d]=eig(z);
r=x*v;
r=r(:,3:-1:2);
c=v(1:2,:);
d=d(3:-1:1,3:-1:1);
d=d(1:2,1:2);
a=find(t==0);
e1=10^-5;
for k=1:100    %迭代
    t1=r*d^-1*r'*t;
    if abs(t1(a,1)-t(a,1))<=e1
        break;
    else
        t(a,1)=t1(a,1);
    end
    aa=k;
end
t1'       %迭代结果
