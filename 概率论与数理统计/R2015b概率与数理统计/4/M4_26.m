clear all;
rng('default') % �����ظ���
x = randn(1,25);  %������̬����ֲ�����
[p,h,stats] = signtest(x,0)
