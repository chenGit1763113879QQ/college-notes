clear all;
rng('default') % 设置重复性
x = randn(1,25);  %创建正态随机分布数据
[p,h,stats] = signtest(x,0)
