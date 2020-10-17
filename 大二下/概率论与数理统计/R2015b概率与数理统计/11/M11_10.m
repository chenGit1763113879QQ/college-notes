clear all;
%���������
seed=931316785;
rand('seed',seed);
randn('seed',seed);
load kmeansdata;  %װ��MATLAB�Դ�����
size(X);  %���ݴ�С
%���ճ��м�ľ�����з���
%�����ĿΪ3
k1=3;
idx3=kmeans(X,k1,'distance','city');
%��ʾ������
figure(1);
[silh3,h]=silhouette(X,idx3,'city');
xlabel('Silhouetteֵ');ylabel('����');
%�����ĿΪ4
k2=4;
idx4=kmeans(X,k2,'dist','city','display','iter');
%��ʾ������
figure(2);
[silh4,h]=silhouette(X,idx4,'city');
xlabel('Silhouetteֵ');ylabel('����');
%�����ĿΪ5
k3=5;
idx5=kmeans(X,k3,'dist','city','replicates',5);
%��ʾ������
figure(3);
[silh5,h]=silhouette(X,idx5,'city');
xlabel('Silhouetteֵ');ylabel('����');
