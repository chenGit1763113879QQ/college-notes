 clear all;
% ������̬�ֲ�������
% ��������
N=1024;
x1=normrnd(5,1,N,1);
x2=normrnd(6,1,N,1);
x=[x1 x2];
%����
figure(1);
sym1='*';
notch1=1;  %����
boxplot(x,notch1,sym1);
figure(2);
notch2=0;  %����
boxplot(x,notch2);
figure(3);
vert=0;  %ˮƽ
boxplot(x,notch1,'+',vert);
