clear all;
x = -1:1:5;
y = randn(20,1);
[h,p,k] = kstest2(x,y)
%���´������ڻ��Ʋ���ͳ��ͼ
F1 = cdfplot(x);
hold on
F2 = cdfplot(y);
set(F1,'LineWidth',2,'Color','r')
set(F2,'LineWidth',2)
legend([F1 F2],'F1(x)','F2(x)','Location','NW')
