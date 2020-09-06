clear all;
n=1000;
t1=0; t2=0; a=[];
for j=1:n
    a(j)=unifrnd(0,1);
    if a(j)<0.5
        t1=t1+1;
    else
        t2=t2+1;
    end
end
p1=t1/n
p2=t2/n
