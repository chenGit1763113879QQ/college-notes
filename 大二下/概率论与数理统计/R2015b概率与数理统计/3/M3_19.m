 clear all;
rng default  
x = [randn(30,1); 5+randn(30,1)];
[f,xi] = ksdensity(x);
figure
plot(xi,f);

