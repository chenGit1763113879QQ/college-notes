 clear all;
%�����������
X = mvnrnd([0 0],[1 0.99; 0.99 1],20);         
X(:,3:4) = mvnrnd([0 0],[1 0.99; 0.99 1],20);
X(:,5:6) = mvnrnd([0 0],[1 0.99; 0.99 1],20);
%����Bartlettά������
[ndim, prob,chisquare] = barttest(X,0.05)
