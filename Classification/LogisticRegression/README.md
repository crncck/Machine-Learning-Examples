# Logistic Regression

Logistic Regression is used to understand the relationship between the dependent variable and one or more independent variables by estimating probabilities using a logistic regression equation. 

- It can help you predict the likelihood of an event happening or a choice being made.

- The dependent variable should be binary like yes or no.



**Linear Regression** outputs *continuous* value, and it has a straight line to map the input variables to the dependent variables. The output can be any of an infinite number of possibilities. 

**Logistic Regression** uses a logistic function to map the input variables to *categorical* response/dependent variables. In contrast to Linear Regression, Logistic Regression outputs a probability between 0 and 1.



<img src="https://tva1.sinaimg.cn/large/008i3skNgy1gw74awq402j30k409274u.jpg" alt="converter" width=500/> 

[Image](https://ichi.pro/tr/python-da-lojistik-regresyon-ve-yapi-modelini-anlamak-25643771585192)

<br>

## Logistic Regression implementation in R

The dataset is [Social Network Ads](https://www.kaggle.com/rakeshrau/social-network-ads) which tells which of the users purchased/not purchased a particular product. The last column of the data contains our dependent variable which is Purchased. We will use Logistic Regression to classify users based on Purchased column.

[Codes](https://github.com/crncck/Machine-Learning/blob/main/Classification/LogisticRegression/logrec.Rmd) and [PDF](https://github.com/crncck/Machine-Learning/blob/main/Classification/LogisticRegression/logrec.pdf)

```R
# Applying logistic regression
model = glm(formula = Purchased ~ ., family = binomial, data = trainSet)
```

