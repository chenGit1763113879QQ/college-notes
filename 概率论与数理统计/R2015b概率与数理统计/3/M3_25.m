clear al;
load gas
fsurfht('gauslike',[112 118],[3 5],price1)    %求似然函数图形
mumax = mean(price1)               %求price1的均值
sigmamax = std(price1)*sqrt(19/20) %求price1的标准差
