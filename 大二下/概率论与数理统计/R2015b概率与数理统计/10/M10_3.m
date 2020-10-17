clear all;
X = mvnrnd([0;0],[1 .9;.9 1],100);
Y = [1 1;1 -1;-1 1;-1 -1];
d1 = mahal(Y,X) % ���Ͼ������
d2 = sum((Y-repmat(mean(X),4,1)).^2, 2) %ŷ��ƽ������
scatter(X(:,1),X(:,2))              %ɢ��ͼ
hold on
scatter(Y(:,1),Y(:,2),100,d1,'r','LineWidth',2)
hb = colorbar;
xlabel('���ݼ�');
ylabel('���Ͼ���')
legend('X','Y','Location','NW')
