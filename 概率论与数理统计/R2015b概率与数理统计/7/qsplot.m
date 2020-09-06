% 编写的趋势图绘制函数为qsplot.m。其源代码如下：
function qsplot(K)
[m,n]=size(K);
nk=ceil(sqrt(n));
mk=ceil(n/nk);
figure;
for kk=1:n
    subplot(mk,nk,kk)
    plot(K(:,kk),'.r-');
    SS=['因素',num2str(kk)];
    title(SS);
end
