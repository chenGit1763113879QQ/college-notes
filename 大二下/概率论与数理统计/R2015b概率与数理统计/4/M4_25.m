clear all;
rng('default') % ���ظ���
x = lognrnd(2,.25,10,1);    %�����ֲ�
y = x + trnd(2,10,1);       %T����ֲ�
[p,h,stats] = signrank(x,y)
