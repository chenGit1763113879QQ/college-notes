clear all;
rng default;  % …Ë÷√÷ÿ∏¥–‘
x = normrnd(0,1,100,100);
m = mean(x);
trim = trimmean(x,10);
sm = std(m);
strim = std(trim);
efficiency = (sm/strim).^2
