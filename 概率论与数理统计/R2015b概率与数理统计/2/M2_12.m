clear all;
%����ָ���ֲ��Ĳ���
mu=4;
%����len�������
len=5;
y1=exprnd(mu, [1 len])
%����P��Q�еľ���
P=3;
Q=4;
y2=exprnd(mu, P,Q)
%��ʾָ���ֲ�����״ͼ
M=1000;
y3=exprnd(mu, [1 M]);
figure(1);
t=0:0.2:max(y3);
hist(y3,t);
axis([0 max(y3) 0 100]);
xlabel('ȡֵ');ylabel('����ֵ');
