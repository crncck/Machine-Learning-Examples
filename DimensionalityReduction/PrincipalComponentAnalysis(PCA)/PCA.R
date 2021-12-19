## ---- warning=FALSE----------------------------------------------------------------------------------------------------
#install.packages('caTools')
#install.packages('caret')
#install.packages('e1071')
library(caTools)
library(caret)
library(e1071)
library(magrittr)
library(dplyr)


## ----------------------------------------------------------------------------------------------------------------------
dataset = read.csv('dataset.csv')
head(dataset, n=5)


## ----------------------------------------------------------------------------------------------------------------------
set.seed(123)
splitted = sample.split(dataset$Customer_Segment, SplitRatio = 0.8)
trainSet = subset(dataset, splitted == TRUE)
testSet = subset(dataset, splitted == FALSE)


## ----------------------------------------------------------------------------------------------------------------------
trainSet[-14] = scale(trainSet[-14])
testSet[-14] = scale(testSet[-14])


## ---- warning=FALSE----------------------------------------------------------------------------------------------------
pca = preProcess(x = trainSet[-14], method = 'pca', pcaComp = 2)
trainSet = predict(pca, trainSet)
testSet = predict(pca, testSet)

# 5 lines of the training set
head(trainSet, n=5)


## ----------------------------------------------------------------------------------------------------------------------
# 2 -> PC1, 3 -> PC2, 1 -> Customer_Segment
trainSet = trainSet[c(2, 3, 1)]
testSet = testSet[c(2, 3, 1)]

head(trainSet, n=5)


## ----------------------------------------------------------------------------------------------------------------------
model = svm(formula = Customer_Segment ~ ., data = trainSet, type = 'C-classification', kernel = 'linear')


## ----------------------------------------------------------------------------------------------------------------------
# -3 to remove dependent variable
prediction = predict(model, newdata = testSet[-3])
prediction


## ----------------------------------------------------------------------------------------------------------------------
# Generate confusion matrix
conf.matrix <- confusionMatrix(table(testSet[, 3], prediction))
conf.matrix


## ----------------------------------------------------------------------------------------------------------------------
# Heatmap visualization of confusion matrix
table <- data.frame(conf.matrix$table)


plotTable <- table %>%
  group_by(prediction) %>%
  mutate(prop = Freq/sum(Freq))

ggplot(data =  plotTable, mapping = aes(x = Var1, y = prediction, alpha = prop)) +
  geom_tile(aes(fill = Freq), colour = "white") +
  geom_text(aes(label = Freq), vjust = .5, fontface  = "bold", alpha = 1, color="white", size=10) +
  scale_fill_gradient(low = "blue", high = "navyblue") +
  theme_bw() + theme(legend.position = "none")



## ----------------------------------------------------------------------------------------------------------------------
set = trainSet
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)

grid_set = expand.grid(X1, X2)

colnames(grid_set) = c('PC1', 'PC2')

y_grid = predict(model, newdata = grid_set)

plot(set[, -3], main = 'SVM (Train set)',
     xlab = 'PC1', ylab = 'PC2',
     xlim = range(X1), ylim = range(X2))

contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)

points(grid_set, pch = '.', col = ifelse(y_grid == 2, 'deepskyblue', ifelse(y_grid == 1, 'springgreen3', 'tomato')))
points(set, pch = 21, bg = ifelse(set[, 3] == 2, 'blue3', ifelse(set[, 3] == 1, 'green4', 'red3')))


## ----------------------------------------------------------------------------------------------------------------------
set = testSet
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)

grid_set = expand.grid(X1, X2)

colnames(grid_set) = c('PC1', 'PC2')

y_grid = predict(model, newdata = grid_set)

plot(set[, -3], main = 'SVM (Test set)',
     xlab = 'PC1', ylab = 'PC2',
     xlim = range(X1), ylim = range(X2))

contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)

points(grid_set, pch = '.', col = ifelse(y_grid == 2, 'deepskyblue', ifelse(y_grid == 1, 'springgreen3', 'tomato')))
points(set, pch = 21, bg = ifelse(set[, 3] == 2, 'blue3', ifelse(set[, 3] == 1, 'green4', 'red3')))

