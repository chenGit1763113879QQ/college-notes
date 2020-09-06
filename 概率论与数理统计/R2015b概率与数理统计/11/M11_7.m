clear all;
rng('default') % 设置重新性
X = rand(10,3);   %随机变量
%构建一个系统聚类树
tree = linkage(X,'average');
figure()
%绘制聚类树
dendrogram(tree)
