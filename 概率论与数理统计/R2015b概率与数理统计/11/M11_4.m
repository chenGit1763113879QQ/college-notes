clear all;
X = randn(4, 3);
D1 = pdist(X,'euclidean')
D2= pdist(X,'seuclidean')
D3=pdist(X,'cityblock')
D4=pdist(X,'minkowski')
D5=pdist(X,'spearman')
D56=pdist(X,'jaccard')
