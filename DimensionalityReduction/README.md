# Principal Component Analysis (PCA)



PCA is an unsupervised algorithm that is used for dimensionality reduction. 



Its goal is to identify and detect the correlation between variables. It is attempting to learn about relationship between values by finding a list of principal axes and it projects high dimensional data into smaller dimensional subspace while keeping most of the information.



PCA's key advantages are:

* its low noise sensitivity 

* the decreased requirements for capacity and memory

- increased efficiency has given the processes taking place in smaller dimensions



PCA is highly get affected by outliers.



## PCA implementation in R

[Codes](https://github.com/crncck/Machine-Learning/blob/main/DimensionalityReduction/PrincipalComponentAnalysis(PCA)/pca.Rmd)

```R
pca = preProcess(x = trainSet[-14], method = 'pca', pcaComp = 2)
```

