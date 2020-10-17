%��MATLAB�Դ������ݻ�����ֱ��ͼ
clear all;
cars = load('carsmall','MPG','Origin'); 
MPG = cars.MPG;
hist(MPG)                  %Ч����ͼ3-4��ʾ
xlabel('����');ylabel('ֱ��ͼ');
set(get(gca,'Children'),'FaceColor',[.8 .8 1]) 
%���Ʋ�ͬ�Ĵ�����ܶȹ������ߣ�Ч����ͼ3-5��ʾ
[f,x,u] = ksdensity(MPG);
plot(x,f)
title('MPG�ĺ��ܶȹ���')
hold on
[f,x] = ksdensity(MPG,'width',u/3);
plot(x,f,':r');
[f,x] = ksdensity(MPG,'width',u*3);
plot(x,f,'--g');
legend('Ĭ�ϴ���','Ĭ��1/3����','Ĭ��3������');
xlabel('x');ylabel('f');
hold off
%���ò�ͬ���ܶȹ��Ʋ�����������Ӧ���ߣ�Ч����ͼ3-6��ʾ
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
%�Ƚ��ܶȹ��ƣ������ͼ����ʾ�˴Ӳ�ͬ��ԭ���ع��ҵ�����ʡ�ͷֲ����ߣ�Ч����ͼ3-7��ʾ
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
xlabel('����');ylabel('���ܶȹ���')
hold off
