 clear all;
x=rand(180,3);
[C,S]=subclust(x,[0.5 0.5 0.5],[],[1.5 0.5 0.15 0])
plot(0,0);
hold on;
plot3(C(:,1),C(:,2),C(:,3),'r+','markersize',16,'LineWidth',3);
%�����������
hold on;
plot3(x(:,1),x(:,2),x(:,3),'g*');
%���Ƴ����ݵ�
view(3)
