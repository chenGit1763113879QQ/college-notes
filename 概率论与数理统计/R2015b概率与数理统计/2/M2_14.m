 clear all;
%���ö���ʽ�ֲ��Ĳ���
N=100;
p=0.5;
%����len�������
len=5;
y1=binornd(N,p,[1 len])
%����P��Q�еľ���
P=3;
Q=4;
y2=binornd(N,p,P,Q)
%��ʾ����ʽ�ֲ�����״ͼ
M=1000;
y3=binornd(N,p,[1 M]);
figure(1);
t=0:2:N;
hist(y3,t);
axis([0 N 0 300]);
xlabel('ȡֵ');ylabel('����ֵ');
