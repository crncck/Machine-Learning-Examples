## ---- warning=FALSE----------------------------------------------------------------------------------------------------
library(caTools)
library(caret)
library(dplyr)
library(rpart)


## ----------------------------------------------------------------------------------------------------------------------
dataset = read.csv('dataset.csv')
dataset = dataset[, 3:5]
head(dataset, n=5)


## ----------------------------------------------------------------------------------------------------------------------
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
dataset$Purchased


## ----------------------------------------------------------------------------------------------------------------------
set.seed(123)
splitted = sample.split(dataset$Purchased, SplitRatio = 0.75)
train_Set = subset(dataset, splitted == TRUE)
test_Set = subset(dataset, splitted == FALSE)


## ----------------------------------------------------------------------------------------------------------------------
trainSet = train_Set
testSet = test_Set
trainSet[-3] = scale(train_Set[-3])
testSet[-3] = scale(test_Set[-3])


## ----------------------------------------------------------------------------------------------------------------------
model = rpart(formula = Purchased ~ ., data = trainSet)


## ----------------------------------------------------------------------------------------------------------------------
probability.prediction = predict(model, newdata = testSet[-3], type = 'class')
probability.prediction


## ----------------------------------------------------------------------------------------------------------------------
# Generate confusion matrix
conf.matrix <- confusionMatrix(table(testSet[, 3], probability.prediction))
conf.matrix


## ----------------------------------------------------------------------------------------------------------------------
# Heatmap visualization of confusion matrix
table <- data.frame(conf.matrix$table)


plotTable <- table %>%
  group_by(probability.prediction) %>%
  mutate(prop = Freq/sum(Freq))

ggplot(data =  plotTable, mapping = aes(x = Var1, y = probability.prediction, alpha = prop)) +
  geom_tile(aes(fill = Freq), colour = "white") +
  geom_text(aes(label = Freq), vjust = .5, fontface  = "bold", alpha = 1, color="white", size=10) +
  scale_fill_gradient(low = "blue", high = "navyblue") +
  theme_bw() + theme(legend.position = "none")



## ----------------------------------------------------------------------------------------------------------------------
set = trainSet
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)

grid_set = expand.grid(X1, X2)

colnames(grid_set) = c('Age', 'EstimatedSalary')

y_grid = predict(model, newdata = grid_set, type = 'class')

plot(set[, -3], main = 'Decision Tree (Train Set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))

contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)

points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'deepskyblue', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'blue3', 'red3'))


## ----------------------------------------------------------------------------------------------------------------------
set = testSet
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)

grid_set = expand.grid(X1, X2)

colnames(grid_set) = c('Age', 'EstimatedSalary')

y_grid = predict(model, newdata = grid_set, type = 'class')

plot(set[, -3], main = 'Decision Tree (Test Set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))

contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)

points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'deepskyblue', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'blue3', 'red3'))


## ----------------------------------------------------------------------------------------------------------------------
model = rpart(formula = Purchased ~ ., data = train_Set)
plot(model)
text(model)

