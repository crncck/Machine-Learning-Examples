# Polynomial Regression

**Polynomial regression** is a form of regression analysis in which the relationship between the independent variable *x* and the dependent variable *y* is modelled as an **nth degree polynomial in x**. 

Polynomial regression fits a nonlinear relationship between the value of x and the corresponding conditional mean of y.

In the real world, not all data fits into a linear model. So, for generating a line to best represents the data, we use polynomial regression.

  - **f( x )  =  c0 + c1 x + c2 x^2 ... cn x^n**
  
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (**n** is the degree of the polynomial and **c** is a set of coefficients.)
  

## Linear Regression implementation in Python

The dataset is [Position Salaries dataset](https://www.kaggle.com/datasets/farhanmd29/position-salaries) which contains 3 columns called Position, Level, and Salary. 

[Codes](https://github.com/crncck/Machine-Learning/blob/main/Regression/PolynomialRegression/PolynomialRegression.ipynb)

```Python
# Applying polynomial regression
model = PolynomialFeatures(degree = 2)
```
