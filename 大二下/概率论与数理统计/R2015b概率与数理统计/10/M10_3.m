clear all;
X = mvnrnd([0;0],[1 .9;.9 1],100);
Y = [1 1;1 -1;-1 1;-1 -1];
d1 = mahal(Y,X) % 马氏距离计算
d2 = sum((Y-repmat(mean(X),4,1)).^2, 2) %欧氏平方距离
scatter(X(:,1),X(:,2))              %散点图
hold on
scatter(Y(:,1),Y(:,2),100,d1,'r','LineWidth',2)
hb = colorbar;
xlabel('数据集');
ylabel('马氏距离')
legend('X','Y','Location','NW')
