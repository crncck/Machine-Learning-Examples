# K-Means Clustering

K-means clustering aims **to partition data into k clusters** in a way that data points in the same cluster are similar and data points in the different clusters are farther apart. It’s an unsupervised machine learning algorithm. It computes the centroids and iterates until it finds optimal centroid. It assumes that the number of clusters are already known. 



The k-means clustering works as follows:



- Choose the k number of clusters
- Select k random points, the centroids (they don’t have to be part of the dataset)
- Assign each point to the closest centroid
- Compute and replace the new centroid of each cluster
- Reassign each data point to the new closest centroid. If any reassignment happens, go back to previous step. 





### **Random Initialization Trap**

Random initialization trap may sometimes prevent us from developing the correct clusters. Depending on the position the centroids are randomly initialized, we can get very different clusters.



### **Determining Optimal Number of Clusters**

The number of clusters that we choose for a given dataset cannot be random. Each cluster is formed by calculating and comparing the distances of data points within a cluster to its centroid. An ideal way to figure out the right number of clusters would be to calculate the Within-Cluster-Sum-of-Squares (WCSS). 



**WCSS** is the sum of squares of the distances of each data point in all clusters to their respective centroids.



We can use some techniques to determine optimal number of clusters. **Elbow method** is one of them. he method consists of plotting the explained variation as a function of the number of clusters, and picking the elbow of the curve as the number of clusters to use.



## K-Means Clustering Implementation in R

The dataset is [Mall Customers](https://www.kaggle.com/shwetabh123/mall-customers) which contains customer informations of a mall. It contains following informations: customer id, gender, age, annual income, spending score. Using elbow method we will find the optimal number of clusters and cluster our customers into that number  of clusters based on annual income and spending score columns.



[Codes](https://github.com/crncck/Machine-Learning/blob/main/Clustering/K-Means/k-means.Rmd) and [PDF](https://github.com/crncck/Machine-Learning/blob/main/Clustering/K-Means/k-means.pdf)



```R
# Applying k-means algorithm
kmeans <- kmeans(X, 5, iter.max = 300, nstart = 10)
```

