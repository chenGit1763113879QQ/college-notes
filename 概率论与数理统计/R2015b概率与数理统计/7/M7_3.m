 clear all;
data1=[1 1 1 51;1 2 2 71;1 3 3 58;2 1 2 82;2 2 3 69;2 3 1 59;...
    3 1 3 77;3 2 1 85;3 2 2 84];
f=3;r=3;
[r1,c]=size(data1); t=zeros(f,r);
for k=1:f
    for j=1:r
        b=0;
        for i=1:r1
            if data1(i,j)==k       %水平相同
                b=b+data1(i,c);
            end
        end
        t(k,j)=b;
    end
end
t1=t/3, t
r=max(t1)-min(t1),
