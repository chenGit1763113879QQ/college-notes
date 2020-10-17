clear all;
load fcmdata.dat
%装载入数据
[center,U,obj_fcn]=fcm(fcmdata,2);
%模糊聚类迭代计算，三个聚类中心
maxU=max(U);
index1=find(U(1,:)==maxU);
index2=find(U(2,:)==maxU);
%最大隶属度函数分类
plot(obj_fcn);
figure;
plot(center(1,1),center(1,2),'ko','markersize',16,'LineWidth',3)
hold on
plot(center(2,1),center(2,2),'kv','markersize',16,'LineWidth',3)
line(fcmdata(index1,1),fcmdata(index1,2),'linestyle','none','marker','o','color','r');
line(fcmdata(index2,1),fcmdata(index2,2),'linestyle','none','marker','x','color','r');
hold off;
