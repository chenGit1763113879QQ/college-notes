 clear all;
N=10000;
m=5;n=20;
mse1=0;mse2=0;mse3=0;
for k=1:N
    x=chi2rnd(m,1,n);
    m1=101*x(1)-100*x(2);
    m2=median(x);
    m3=mean(x);
    mse1=mse1+(m1-m)^2;
    mse2=mse2+(m2-m)^2;
    mse3=mse3+(m3-m)^2;
end
mse1=mse1/N
mse2=mse2/N
mse3=mse2/N
