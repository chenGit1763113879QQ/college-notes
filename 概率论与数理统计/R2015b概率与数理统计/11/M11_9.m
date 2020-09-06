 clear all;
X = rand(2000,3);
c = clusterdata(X,'linkage','ward','savememory','on','maxclust',4);
scatter3(X(:,1),X(:,2),X(:,3),10,c);
xlabel('X(:,1)');ylabel('X(:,2)');zlabel('X(:,3)');
set(gcf,'color','w');
