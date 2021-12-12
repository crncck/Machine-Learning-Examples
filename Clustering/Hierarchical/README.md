# Hierarchical Clustering



Hierarchical clustering is **an algorithm that groups similar objects into groups called clusters**. It is an alternative approach to k-means clustering for identifying groups. The endpoint is a set of clusters, where each cluster is distinct from the other cluster, and the objects within each cluster are broadly similar to each other. 

- It’s an unsupervised machine learning algorithm. 
- The hierarchical clustering does not require us to pre-specify the number of clusters to be generated as is required by the k-means approach. 
- It has a tree-based representation called **dendrogram** which is a diagram that shows the hierarchical relationship between objects.



Hierarchical clustering can be divided into two main types: **agglomerative** and **divisive**. 

<br>

## A) Agglomerative Clustering

It is a bottom-up approach. In the beginning, each object is initially considered as a single-element cluster. At each step of the algorithm, the two clusters that are the most similar are combined into a new bigger cluster. This procedure is iterated until all points are member of just one single big cluster. 

This process has a **O(N^3) time complexity** and a **O(N^2) memory complexity** that makes it *not tractable for large datasets*.



How it works:

- Make each data point a single-point cluster
- Take the two closest *data points* and make them one cluster
- Take the two closest *clusters* and make them one cluster
- Repeat the previous step until there is only one cluster

<br>

## B) Divisive Clustering

It is a top-down approach. It begins with the root, in which all objects are included in a single cluster. At each step of iteration, the most heterogeneous cluster is divided into two. The process is iterated until all objects are in their own cluster.

This process requires at each iteration to search for the best split, implying a **O(2N) time complexity** that has to be tackled with some heuristics. *Divisive hierarchical clustering is good at identifying large clusters.*

<br>



### Linkage Criterion

*How do we define the distance between clusters?*  - With **linkage criterion**

The linkage criterion determines the distance between sets of observations as a function of the pairwise distances between observations. We should determine from where distance is computed.

- **a) Minimum Linkage:** Linkage criterion is the minimal distance between a point of A and a point of B.
- **b) Maximum Linkage:** Linkage criterion is the maximal distance between a point of A and a point of B.
- **c) Average Linkage:** Linkage criterion is the average of all the distances between any point of A and any point of B.
- **d) Ward’s Minimum Variance Method:** Ward's minimum variance criterion minimizes the total within-cluster variance. At each step it finds the pair of clusters that leads to minimum increase in total within-cluster variance after merging.  



<br>

### Dendrogram

A dendrogram is a tree-like chart that shows the sequences of merges or splits of clusters. We can use dendrograms to choose the optimal number of clusters. 



<img src="https://tva1.sinaimg.cn/large/008i3skNgy1gxbbhaimn4j30vg0krmy9.jpg" alt="converter" width="700" />





## Hierarchical Clustering Implementation in R

The dataset is [Mall Customers](https://www.kaggle.com/shwetabh123/mall-customers) which contains customer informations of a mall. It contains following informations: customer id, gender, age, annual income, spending score. We will apply hierarchical clustering and visualize the clusters.

[Codes](https://github.com/crncck/Machine-Learning/blob/main/Clustering/Hierarchical/hierarchical.Rmd) and [PDF](https://github.com/crncck/Machine-Learning/blob/main/Clustering/Hierarchical/hierarchical.pdf)

```R
# Applying hierarchical clustering algorithm
hc <- hclust(dist(X, method = 'euclidean'), method = 'ward.D')
y_hc <- cutree(hc, 5)   # clusters
```
