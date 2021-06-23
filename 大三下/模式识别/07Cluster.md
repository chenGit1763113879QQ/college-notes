# Clustering

- Partitional Clustering
  - K-Series
  - Graph Theory based 
  - ...
- Hierarchical Clustering
  - Top-down Division
  - Bottom-up Agglomerative

## Partitional Clustering

- to cluster dataset into several subsets based on one criterion function
- problems
  - The **numbers of subsets**(聚类数) is usually predetermined
    - The choice of initial representative point of each class每个类别的初始代表点，一定要选择好，巧
  - Similarity measurement相似性
    - One form of distance measurement
  - The determination of the criterion function聚类准则函数 for clustering is an optimize process achieving the best classification results

## K-means

- Euclidean distance $d=\sqrt{x^Tx}$
- minimum of error squre sum（最小误差平方和，使每个样本值与所在类均值的差的和最小）

$$
J=\sum_{i=1}^{N}\sum_{x\in c_i} ||x-\mu_i||^2
$$

1. (开始时选取一个样本作为类中心)dividing into preset C classes and computing the mean of each class
2. (欧式距离)Computing the Euclidean distance to the center of one class and decide which class the sample belongs to
3. (确定样本所属类)assign each sample to the appreciate class based on the rule of minimum Euclidean distance
4. (计算类均值作为新的中心)computing the mean of updated classes
5. (迭代)If the current center of each class is the same as the one of prior same class, then the K-Means algorithm is finished
6. (结束)Otherwise, return to Step2,Step3,Step4, and make a decision whether the condition of finish is satisfied

## Hierarchical clustering

Even if the number of classes is unknown,can be used to find the optimal solution according to compactness

- Agglomeractive hierarchical algorithm聚集: **bottom-up**
  1. find each data point of its own class
  2. merge pairs of clusters  class:compute the inter-class distance(类间距离) $d_{ij}$,taking two nearest clusters, and agglomerating them to form one single cluster, so that the total number $k$ of classes is reduced to $k=n-1$
     1. 类间距离原则：最小值（默认）、平均值，最大值
     2. 聚类原则：最小值（默认）、平均值、最大值
  3. Proceeding recursively Step 2 until the desired number of clusters is obtained
- Divisive hierachical algorithm分裂
