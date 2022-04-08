# Simple Linear Regression

**Regression** is used to predict a **continuous dependent variable** from independent variables. 

When the dependent variable is **dichotomous** (has only two possible values), the **Logistic Regression** should be used.


Simple Linear Regression summarizes and studies relationships between two continuous variable:

- x: independent variable
- y: dependent variable

Simple linear regression model can be represented using the below equation:
   - **y = a0 + a1x + ε**
   
   
   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a0: the intercept of the regression line

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a1: the slope of the regression line 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ε: the error term


## Linear Regression implementation in Python

The dataset is [Years of Experience and Salary dataset](https://www.kaggle.com/datasets/rohankayan/years-of-experience-and-salary-dataset) which contains 2 columns called Years of Experience and Salary. 

[Codes](https://github.com/crncck/Machine-Learning/blob/main/Regression/SimpleLinearRegression/SimpleLinearRegression.ipynb)

```Python
# Applying linear regression
model = LinearRegression()
```
