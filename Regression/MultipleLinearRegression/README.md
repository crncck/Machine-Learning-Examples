# Multiple Linear Regression

**Multiple Linear Regression** is an extension of **Simple Linear Regression**. It is used *when we want to predict the value of a variable based on the value of two or more other variables*.

Linear regression can only be used when one has two continuous variables — an independent variable and a dependent variable. The independent variable is the parameter that is used to calculate the dependent variable or outcome. A Multiple regression model extends to several explanatory variables.

- f( x ) = y = c0 + c1x1 + c2x2 ... cn xn + ε

  - y = the predicted value of the dependent variable
  - c0 = the y-intercept (value of y when all other parameters are set to 0)
  - c1x1 = the regression coefficient of the first independent variable (x1)
  - cnxn = the regression coefficient of the last independent variable
  - ε = model error
   

## Multiple Linear Regression implementation in Python

The dataset is [50 Startups](https://www.kaggle.com/datasets/farhanmd29/50-startups) which contains data collected from New York, California and Florida about 50 business Startups "17 in each state". It has R&D Spend,
Administration, Marketing Spend, State, and Profit attributes.

[Codes](https://github.com/crncck/Machine-Learning/blob/main/Regression/MultipleLinearRegression/MultipleLinearRegression.ipynb)

```Python
# Applying multiple linear regression
regressor = LinearRegression()
```
