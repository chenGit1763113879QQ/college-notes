 clear all;
% ���ݵ�����
x1=0.1:0.01:0.18;
x2=[x1 0.2 0.21 0.23]';
y=[42.0	41.5	45.0	45.5	45.0	47.2	49.0	55.0	50.3	55.0	55.5	60.5]';
x=[ones(12,1),x2];
% �����ݵ�ɢ��ͼ
plot(x2,y,'rp');
% �ع����
[b,bint,r,rint,stats]=regress(y,x);
b,bint,stats
% ���в����ͼ
rcoplot(r,rint);
title('�в�ͼ�Ļ���');
xlabel('����'); ylabel('�в�');
% Ԥ�⼰���ع���ͼ
z=b(1)+b(2)*x2;
figure;
plot(x2,y,'rp',x2,z,'b');
