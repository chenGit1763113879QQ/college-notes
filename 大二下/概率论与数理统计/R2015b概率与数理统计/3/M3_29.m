 clear all;
%������̬�ֲ�����
M=100;N=1;
x=normrnd(0,1,M,N);
%���ɾ��ȷֲ�
y=rand(M,N);
z=[x,y];
%����QQͼ
subplot(221);
h1=qqplot(z);
xlabel('��׼��̬����');ylabel('��������');title('QQͼ');
legend('��̬�ֲ�����','���ȷֲ�����');
grid on;
%����������̬�ֲ�����
x=normrnd(0,1,100,1);
y=normrnd(0.5,2,50,1);
subplot(222)
h2=qqplot(x,y);
xlabel('��������x');ylabel('��������y ');title('QQͼ');
grid on;
%����������ͬ�ֲ�������
x=normrnd(5,1,100,1);
y=weibrnd(2,0.5,100,1);
subplot(223)
h3=qqplot(x,y);
xlabel('��������x');ylabel('��������y');title('QQͼ');
grid on;
subplot(224)

%����һ����̬�ֲ�������
x=normrnd(10,1,100,1);
subplot(224)
qqplot(x);
xlabel('��������x');ylabel('��������x');title('QQͼ');
grid on;

