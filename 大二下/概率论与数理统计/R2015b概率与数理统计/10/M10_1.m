 clear all;
load fisheriris          %载入数据
SL = meas(51:end,1);
SW = meas(51:end,2);
group = species(51:end);
h1 = gscatter(SL,SW,group,'rb','v^',[],'off');   %效果如图8-12所示
set(h1,'LineWidth',2)
legend('费希尔云芝','费希尔锦葵','位置','NW');
K = coeff(1,2).const;
L = coeff(1,2).linear; 
Q = coeff(1,2).quadratic;
f = @(x,y) K + [x y]*L + sum(([x y]*Q) .* [x y], 2);
h2 = ezplot(f,[4.5 8 2 4]);         
set(h2,'Color','m','LineWidth',2)
axis([4.5 8 2 4])
xlabel('萼片长度')
ylabel('萼片宽度')
title('{\bf 分类与萼片训练数据}');
