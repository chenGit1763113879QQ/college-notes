 clear all;
x = randn(1000,1);
subplot(3,1,1)
xbins1 = -4:4;
hist(x,xbins1)
subplot(3,1,2)
xbins2 = -2:2;
hist(x,xbins2)
subplot(3,1,3)
xbins3 = [-4 -2.5 0 0.5 1 3];
hist(x,xbins3)
