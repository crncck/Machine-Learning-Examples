# Principal Component Analysis (PCA)



PCA is an unsupervised algorithm that is used for dimensionality reduction. 



Its goal is to identify and detect the correlation between variables. It is attempting to learn about relationship between values by finding a list of principal axes and it projects high dimensional data into smaller dimensional subspace while keeping most of the information.



PCA's key advantages are:

* its low noise sensitivity 

* the decreased requirements for capacity and memory

- increased efficiency has given the processes taking place in smaller dimensions



PCA is highly get affected by outliers.



## PCA implementation in R

The dataset is [Wine dataset](https://archive.ics.uci.edu/ml/datasets/wine) which contains the results of a chemical analysis of wines grown in a specific area of Italy. Three types of wine are represented in the 178 samples, with the results of 13 chemical analyses recorded for each sample. 

The last column of the data contains our dependent variable which is Customer_Segment. Our task is classifying the wines based on their properties for customers. We used PCA to reduce dimensions from 13 to 2 dimensions.

[Codes](https://github.com/crncck/Machine-Learning/blob/main/DimensionalityReduction/PrincipalComponentAnalysis(PCA)/pca.Rmd) and [PDF](https://github.com/crncck/Machine-Learning/blob/main/DimensionalityReduction/PrincipalComponentAnalysis(PCA)/pca.pdf)

```R
pca = preProcess(x = trainSet[-14], method = 'pca', pcaComp = 2)
```
