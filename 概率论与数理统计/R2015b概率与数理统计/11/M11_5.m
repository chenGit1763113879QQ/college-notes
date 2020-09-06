clear all;
X=[1 2;2.5 4.5;2 2;4 1.5;4 2.5];  %分析数据矩阵
%显示5个变量的位置
figure(1);
plot(X(:,1),X(:,2),'*');
grid on;axis([0 5 0 5]);gname
%计算变量之间的距离信息
Y=pdist(X);
disp('各个变量之间的距离阵为：')
DisM=squareform(Y)
disp('系统聚类树连接信息矩阵为：')
Z=linkage(Y)  %生成系统聚类树
