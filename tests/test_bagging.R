# Load necessary libraries
library(simpleEnsembleGroup16)
library(testthat)

# Define test cases for the bagging function
test_that("bagging function works correctly", {
  # Generate synthetic data for testing
  set.seed(123)
  X <- matrix(rnorm(100), ncol = 2)
  y <- rnorm(50)

  # Test bagging with linear regression model
  bagged_lm <- bagging("linear_regression", X, y, 100,50)
  expect_is(bagged_lm, "numeric")
  expect_length(bagged_lm, length(y))

  # Test bagging with logistic regression model
  binary_y <- as.integer(y > 0)
  bagged_glm <- bagging("logistic_regression", X, binary_y, 100,50)
  expect_is(bagged_glm, "numeric")
  expect_length(bagged_glm, length(binary_y))

  # Test bagging with ridge regression model
  bagged_ridge <- bagging("ridge_regression", X, y, 100,50, lambda = 0.1)
  expect_is(bagged_ridge, "numeric")
  expect_length(bagged_ridge, length(y))

  # Test bagging with lasso regression model
  bagged_lasso <- bagging("lasso_regression", X, y, 100,50, lambda = 0.1)
  expect_is(bagged_lasso, "numeric")
  expect_length(bagged_lasso, length(y))

  # Test bagging with elastic net
  bagged_elastic <- bagging("elastic_net", X, y, 100,50, nfolds=5)
  expect_is(bagged_elastic, "numeric")
  expect_length(bagged_elastic, length(y))

  # Test bagging with random forest regression model
  bagged_rf <- bagging("random_forest_regression", X, y, 100,50, ntree = 500)
  expect_is(bagged_rf, "numeric")
  expect_length(bagged_rf, length(y))

  # Test bagging with xgboost regression model
  bagged_xgb <- bagging("xgboost_regression", X, y, 100, 50, nrounds = 100)
  expect_is(bagged_xgb, "numeric")
  expect_length(bagged_xgb, length(y))

  # Test bagging with SVM regression model
  bagged_svm <- bagging("svm_regression", X, y, 100, 50, kernel = "linear")
  expect_is(bagged_svm, "numeric")
  expect_length(bagged_svm, length(y))
})
