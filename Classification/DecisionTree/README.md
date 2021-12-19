# Decision Tree

Decision tree is a supervised learning technique that can be used for both classification and regression problems, but mostly it is preferred for solving classification problems. 
- It is a tree-structured classifier
- Internal nodes represent the features of a dataset
- Branches represent the decision rules
- Each leaf node represents the outcome

<br>

## Decision Tree implementation in R

The dataset is [Social Network Ads](https://www.kaggle.com/rakeshrau/social-network-ads) which tells which of the users purchased/not purchased a particular product. The last column of the data contains our dependent variable which is Purchased.

[Codes](https://github.com/crncck/Machine-Learning/blob/main/Classification/DecisionTree/decision_tree.Rmd) and [PDF](https://github.com/crncck/Machine-Learning/blob/main/Classification/DecisionTree/decision_tree.pdf)

```R
# Applying decision tree
model = rpart(formula = Purchased ~ ., data = trainSet)
```
