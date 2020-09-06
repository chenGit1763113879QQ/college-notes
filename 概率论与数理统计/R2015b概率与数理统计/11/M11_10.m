clear all;
%产生随机数
seed=931316785;
rand('seed',seed);
randn('seed',seed);
load kmeansdata;  %装载MATLAB自带数据
size(X);  %数据大小
%按照城市间的距离进行分类
%类的数目为3
k1=3;
idx3=kmeans(X,k1,'distance','city');
%显示聚类结果
figure(1);
[silh3,h]=silhouette(X,idx3,'city');
xlabel('Silhouette值');ylabel('聚类');
%类的数目为4
k2=4;
idx4=kmeans(X,k2,'dist','city','display','iter');
%显示聚类结果
figure(2);
[silh4,h]=silhouette(X,idx4,'city');
xlabel('Silhouette值');ylabel('聚类');
%类的数目为5
k3=5;
idx5=kmeans(X,k3,'dist','city','replicates',5);
%显示聚类结果
figure(3);
[silh5,h]=silhouette(X,idx5,'city');
xlabel('Silhouette值');ylabel('聚类');
