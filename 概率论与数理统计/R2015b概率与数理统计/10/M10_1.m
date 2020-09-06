 clear all;
load fisheriris          %��������
SL = meas(51:end,1);
SW = meas(51:end,2);
group = species(51:end);
h1 = gscatter(SL,SW,group,'rb','v^',[],'off');   %Ч����ͼ8-12��ʾ
set(h1,'LineWidth',2)
legend('��ϣ����֥','��ϣ������','λ��','NW');
K = coeff(1,2).const;
L = coeff(1,2).linear; 
Q = coeff(1,2).quadratic;
f = @(x,y) K + [x y]*L + sum(([x y]*Q) .* [x y], 2);
h2 = ezplot(f,[4.5 8 2 4]);         
set(h2,'Color','m','LineWidth',2)
axis([4.5 8 2 4])
xlabel('��Ƭ����')
ylabel('��Ƭ���')
title('{\bf ��������Ƭѵ������}');
