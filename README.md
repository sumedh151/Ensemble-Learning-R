simpleEnsembleGroup16
=====================

    library(simpleEnsembleGroup16)

* * *

Introduction
============

The `simpleEnsembleGroup16` package provides a collection of functions for performing various regression techniques, including linear regression, logistic regression, ridge & lasso regression, and random forest regression. Additionally, the package offers functionalities for feature selection, bagging and ensemble modeling.

The main features of the package are:

*   **Linear Regression**: Perform linear regression using the ordinary least squares method.
*   **Logistic Regression**: Perform logistic regression for binary classification problems.
*   **Lasso Regression**: Implement Lasso regression, a regularization technique for linear regression models.
*   **Ridge Regression**: Implement Ridge regression, a regularization technique for linear regression models.
*   **Random Forest Regression**: Perform Random Forest regression, a powerful ensemble learning method for regression tasks. If y is binary, it will perform classification by default.
*   **Support Vector Machine Regression**: Perform Support Vector Machine regression, a powerful method for regression tasks. If y is binary, it will perform classification by default.
*   **XGBoost Regression**: Perform XGBoost regression, a powerful boosting method for regression tasks. If y is binary, it will perform classification by default.
*   **Feature Selection**: Perform univariate feature selection based on Pearson Correlation Coefficient for regression or Point-Biserial Correlation Coefficient for binary classification.
*   **Bagging**: Perform bagging using bootrstrap aggregation.
*   **Ensemble Modeling**: Combine the predictions of multiple models using various ensemble techniques.

This vignette provides an overview of the package’s functionalities and demonstrates the usage of each function with examples and sample data.n

* * *

Documentation
=============

1\. Linear Regression
---------------------

**Description**

The `linear_regression` function performs linear regression using the ordinary least squares method. Here’s an example:

**Usage**

    set.seed(123)
    X <- matrix(rnorm(100), ncol = 2)
    y <- rnorm(50)
    
    # Perform linear regression
    result <- linear_regression(X, y)

**Arguments**

*   **X**: Matrix of predictors/independent variables.
*   **y**: Response variable.

2\. Logistic Regression
-----------------------

**Description**

The `logistic_regression` function performs logistic regression for binary classification problems. Here’s an example:

**Usage**

    set.seed(123)
    X <- matrix(rnorm(100), ncol = 2)
    y <- sample(c(0, 1), 50, replace = TRUE)
    
    # Perform logistic regression
    result <- logistic_regression(X, y)

**Arguments**

*   **X:** Matrix of predictors/independent variables.
*   **y:** Response variable (binary).

3\. Ridge Regression
--------------------

**Description**

The `ridge_regression` function performs Ridge regression. Here’s an example:

**Usage**

    set.seed(123)
    X <- matrix(rnorm(100), ncol = 2)
    y <- rnorm(50)
    lambda <- 0.1
    
    # Perform ridge regression
    result <- ridge_regression(X, y, lambda)
    #> Warning: package 'glmnet' was built under R version 4.3.3
    #> Loading required package: Matrix
    #> Loaded glmnet 4.1-8

If y is binary, binary classification is done by default.

    X_binary <- matrix(rnorm(100), ncol = 2)
    y_binary <- sample(c(0, 1), 50, replace = TRUE)
    lambda <- 0.1
    result_binary <- ridge_regression(X_binary, y_binary, lambda)

**Arguments**

*   **X:** Matrix of predictors/independent variables.
*   **y:** Response variable.
*   **lambda:** Ridge parameter.

4\. Lasso Regression
--------------------

**Description**

The `lasso_regression` function performs Lasso regression. Here’s an example:

**Usage**

    set.seed(123)
    X <- matrix(rnorm(100), ncol = 2)
    y <- rnorm(50)
    lambda <- 0.1
    
    # Perform Lasso regression
    result <- lasso_regression(X, y, lambda)

If y is binary, binary classification is done by default.

    X_binary <- matrix(rnorm(100), ncol = 2)
    y_binary <- sample(c(0, 1), 50, replace = TRUE)
    lambda <- 0.1
    result_binary <- lasso_regression(X_binary, y_binary, lambda)

**Arguments**

*   **X:** Matrix of predictors/independent variables.
*   **y:** Response variable.
*   **lambda:** Lasso parameter.

5\. Random Forest Regression
----------------------------

**Description**

The `random_forest_regression` function performs Random Forest regression. Here’s an example:

**Usage**

    set.seed(123)
    X <- matrix(rnorm(100), ncol = 2)
    y <- rnorm(50)
    
    # Perform Random Forest regression
    result <- random_forest_regression(X, y)
    #> Warning: package 'randomForest' was built under R version 4.3.3
    #> randomForest 4.7-1.1
    #> Type rfNews() to see new features/changes/bug fixes.

If y is binary, binary classification is done by default.

    X_binary <- matrix(rnorm(100), ncol = 2)
    y_binary <- sample(c(0, 1), 50, replace = TRUE)
    result_binary <- random_forest_regression(X_binary, y_binary)
    #> Warning in randomForest.default(x = X, y = y, ntree = ntree): The response has
    #> five or fewer unique values.  Are you sure you want to do regression?

**Arguments**

*   **X:** Matrix of predictors/independent variables.
*   **y:** Response variable.
*   **ntree:** Number of trees to grow (default: 500).

6\. Support Vector Machine Regression
-------------------------------------

**Description**

The `svm_regression` function performs Support Vector Machine regression. Here’s an example:

**Usage**

    set.seed(123)
    X <- matrix(rnorm(100), ncol = 2)
    y <- rnorm(50)
    
    # Perform SVM regression
    result <- svm_regression(X, y)

If y is binary, binary classification is done by default.

    X_binary <- matrix(rnorm(100), ncol = 2)
    y_binary <- sample(c(0, 1), 50, replace = TRUE)
    result_binary <- svm_regression(X_binary, y_binary)

**Arguments**

*   **X:** Matrix of predictors/independent variables.
*   **y:** Response variable.
*   **kernel:** Kernel function to be used. Default is “linear”.

7\. XGBoost Regression
----------------------

**Description**

The `xgboost_regression` function performs XGBoost regression. Here’s an example:

**Usage**

    set.seed(123)
    X <- matrix(rnorm(100), ncol = 2)
    y <- rnorm(50)
    
    # Perform XGBoost regression
    result <- xgboost_regression(X, y, nrounds= 10)
    
If y is binary, binary classification is done by default.

    X_binary <- matrix(rnorm(100), ncol = 2)
    y_binary <- sample(c(0, 1), 50, replace = TRUE)
    result_binary <- xgboost_regression(X_binary, y_binary, nrounds= 10)

**Arguments**

*   **X:** Matrix of predictors/independent variables.
*   **y:** Response variable.
*   **nrounds:** Number of boosting rounds. Default is 100.

8\. Bagging
-----------

**Description**

The `bagging` function implements the bagging (bootstrap aggregating) ensemble method for regression models. Here’s an example:

**Usage**

      set.seed(123)
      X <- matrix(rnorm(100 * 5), ncol = 5)
      beta <- rnorm(5)
      y <- X %*% beta + rnorm(100)
      n <- nrow(X)
      bagging_result <- bagging("linear_regression", X, y, 100, n)

**Arguments**

*   **model:** A character string specifying the regression model to use
*   **X:** The matrix of predictors
*   **y:** The response variable
*   **R:** Number of bagging iterations
*   **additional\_args:** Additional arguments to pass to the regression model function

9\. Feature Selection
---------------------

**Description**

The `univariate_feature_selection` function performs univariate feature selection based on Pearson Correlation Coefficient for regression problems or Point-Biserial Correlation Coefficient for binary classification problems.

When the predictor has discrete variables, factorize the columns before passing it to the function.

Here’s an example:

**Usage**

For Continuous y

      set.seed(123)
      n <- 50
      p <- 1000
      X <- matrix(rnorm(n * p), nrow = n, ncol = p)
      y <- rnorm(n)
      selected_data <- univariate_feature_selection(X, y, K = 3)

For Binary y

      set.seed(123)
      n <- 50
      p <- 1000
      X <- matrix(rnorm(n * p), nrow = n, ncol = p)
      y <- factor(sample(c(0, 1), n, replace = TRUE))
    
      selected_data <- univariate_feature_selection(X, y, K = 3)

**Arguments**

*   **X:** Matrix of predictor variables.
*   **y:** Vector of target variable.
*   **K:** Number of top predictors to select.

10\. Ensemble Modeling
----------------------

**Description**

The `ensemble_model` function combines the predictions of multiple models. Here’s an example:

**Usage**

    X_train <- matrix(rnorm(100), ncol = 2)
    y_train <- rnorm(50)
    
    ensemble_model(c("linear_regression", "random_forest_regression"),
                    c("regression", "regression"),
                    list(list(), list(ntree = 500)),
                    X_train, y_train)
                    
**Arguments**

*   **models:** List of model names.
*   **types:** List of model types corresponding to each model.
*   **params:** List of parameters corresponding to each model.
*   **X:** Feature matrix.
*   **y:** Target variable.

* * *

Conclusion
==========

The `simpleEnsembleGroup16` package offers a comprehensive set of tools for regression analysis, feature selection, and ensemble modeling. With its user-friendly interface and well-documented functions, this package simplifies the process of applying these techniques to your data.

In addition to the core regression functions, the package’s feature selection and ensemble modeling capabilities enable you to enhance the performance and robustness of your models. The `univariate_feature_selection_corr` function allows you to identify the most relevant predictors, while the `ensemble_model` function provides a convenient way to combine multiple models and leverage their collective strengths.

Whether you’re working on regression tasks, classification problems, or exploring advanced modeling techniques, the `simpleEnsembleGroup16` package offers a versatile toolkit to streamline your analysis workflow. We encourage you to explore the package’s functions and adapt them to your specific use cases.

If you encounter any issues or have suggestions for improvements, please feel free to contribute to the package’s development or reach out to the maintainers for support.
