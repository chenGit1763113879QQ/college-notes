%对MATLAB自带的数据绘制其直方图
clear all;
cars = load('carsmall','MPG','Origin'); 
MPG = cars.MPG;
hist(MPG)                  %效果如图3-4所示
xlabel('样本');ylabel('直方图');
set(get(gca,'Children'),'FaceColor',[.8 .8 1]) 
%绘制不同的窗宽核密度估计曲线，效果如图3-5所示
[f,x,u] = ksdensity(MPG);
plot(x,f)
title('MPG的核密度估计')
hold on
[f,x] = ksdensity(MPG,'width',u/3);
plot(x,f,':r');
[f,x] = ksdensity(MPG,'width',u*3);
plot(x,f,'--g');
legend('默认窗宽','默认1/3窗宽','默认3倍窗宽');
xlabel('x');ylabel('f');
hold off
%设置不同核密度估计参数，绘制相应曲线，效果如图3-6所示
hname = {'normal' 'epanechnikov' 'box' 'triangle'};
colors = {'r' 'b' 'g' 'm'};
for j=1:4
    [f,x] = ksdensity(MPG,'kernel',hname{j});
    plot(x,f,colors{j});
    hold on;
end
legend(hname{:});
xlabel('x');ylabel('f');
hold off
%比较密度估计，下面的图表显示了从不同的原产地国家的汽车省油分布曲线，效果如图3-7所示
Origin = cellstr(cars.Origin);
I = strcmp('USA',Origin);
J = strcmp('Japan',Origin);
K = ~(I|J);
MPG_USA = MPG(I);
MPG_Japan = MPG(J);
MPG_Europe = MPG(K);
[fI,xI] = ksdensity(MPG_USA);
plot(xI,fI,':b')
hold on
[fJ,xJ] = ksdensity(MPG_Japan);
plot(xJ,fJ,'r')
[fK,xK] = ksdensity(MPG_Europe);
plot(xK,fK,'--g')
legend('USA','Japan','Europe')
xlabel('样本');ylabel('核密度估计')
hold off
