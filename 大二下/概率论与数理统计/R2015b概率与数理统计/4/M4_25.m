clear all;
rng('default') % 可重复性
x = lognrnd(2,.25,10,1);    %对数分布
y = x + trnd(2,10,1);       %T随机分布
[p,h,stats] = signrank(x,y)
