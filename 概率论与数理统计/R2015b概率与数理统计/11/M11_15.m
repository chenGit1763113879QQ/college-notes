clear all;
load fcmdata.dat
%װ��������
[center,U,obj_fcn]=fcm(fcmdata,2);
%ģ������������㣬������������
maxU=max(U);
index1=find(U(1,:)==maxU);
index2=find(U(2,:)==maxU);
%��������Ⱥ�������
plot(obj_fcn);
figure;
plot(center(1,1),center(1,2),'ko','markersize',16,'LineWidth',3)
hold on
plot(center(2,1),center(2,2),'kv','markersize',16,'LineWidth',3)
line(fcmdata(index1,1),fcmdata(index1,2),'linestyle','none','marker','o','color','r');
line(fcmdata(index2,1),fcmdata(index2,2),'linestyle','none','marker','x','color','r');
hold off;
