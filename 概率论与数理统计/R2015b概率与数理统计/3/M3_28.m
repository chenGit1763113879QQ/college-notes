clear al;
%������̬�ֲ�����
M=100;N=1;
x=normrnd(0,1,M,N);
%���ɾ��ȷֲ�
y=rand(M,N);
z=[x,y];
%������̬����ͼ
h=normplot(z);
xlabel('����');ylabel('����');
title('��̬����ͼ');
legend('��̬�ֲ�����','���ȷֲ�����');
grid on;
