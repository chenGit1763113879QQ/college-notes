clear all;
%����MATLAB�Դ�acetylene.mat���ݣ�����Ԥ�����x1��x2��x3������Ӧ����y
load acetylene
%����Ԥ�����
subplot(1,3,1);plot(x1,x2,'.');
xlabel('x1'); ylabel('x2'); 
grid on; axis square;
subplot(1,3,2);plot(x1,x3,'.');
xlabel('x1'); ylabel('x3'); 
grid on; axis square;
subplot(1,3,3);plot(x2,x3,'.');
xlabel('x2'); ylabel('x3'); 
grid on; axis square;
%ʹ��x2fx����ʵ�־������ã�ʹ��ridge����ʵ����ع��������
X = [x1 x2 x3];
D = x2fx(X,'interaction');
D(:,1) = [];         % û�г�����
k = 0:1e-5:5e-3;
b = ridge(y,D,k);
figure;
%������켣ͼ
plot(k,b,'LineWidth',2);
ylim([-100 100]);
grid on 
xlabel('�����');ylabel('��׼��ϵ��');title('�����');
legend('x1','x2','x3','x1x2','x1x3','x2x3');
