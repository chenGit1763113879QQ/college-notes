 clear all;
x=[1,2,6,11]';
y=pdist(x,'cityblock');         %计算样品间绝对值距离
%定义元胞数组method，各元胞分别对应不同系统聚类法
method={'average','centroid','complete','median','single','ward','weighted'};
%通过循环计算7种系统聚类法对应的Cophenetic相关系数
for i=1:7
    Z=linkage(y,method{i});            %利用第i种系统聚类法创建聚类树
    c(i)=cophenet(Z,y);    %计算第i种系统聚类树对应的Cophenetic相关系数
end
disp('Cophenetic相关系数')
c
Z=linkage(y,'average');                 %利用类平均法创建聚类树
[c1,d]=cophenet(Z,y)          %计算Cophenetic相关系数c和Cophenetic距离向量d
RH0=corr(y',d')                         %计算y与d的线性相关系数
