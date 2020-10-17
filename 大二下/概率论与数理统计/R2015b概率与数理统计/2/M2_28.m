clear all;
x=unidrnd(6,1000,1);
f=[];
for i=1:12
    if i<11
        n=i*10;
    elseif i==11
        n=50*10;
    else
        n=100*10;
    end
    y=x(1:n);
    f=[f;sum([y==1,y==2,y==3,y==4,y==5,y==6])/n];
end
