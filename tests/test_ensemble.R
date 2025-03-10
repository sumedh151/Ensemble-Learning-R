library(testthat)
library(simpleEnsembleGroup16)

# Create test data
set.seed(123)
X <- matrix(rnorm(100), ncol = 2)
y <- rnorm(50)
binary_y <- as.integer(y > 0)

# Define mock models
mock_linear_regression <- function(X, y, ...) {
  return(rep(1, nrow(X)))
}

mock_random_forest_regression <- function(X, y, ntree = 500) {
  return(rep(2, nrow(X)))
}

# Test ensemble_model function for elastic net and random forest
test_that("ensemble_model function combines predictions correctly", {
  predictions <- ensemble_model(c("elastic_net", "random_forest_regression"),
                                c("regression", "regression"),
                                list(list(), list(ntree = 500)),
                                X,
                                y)
  expect_is(predictions, "numeric")
  expect_length(predictions, nrow(X))
})

# Test ensemble_model function for linear and random forest regressipn
test_that("ensemble_model function combines predictions correctly", {
  predictions <- ensemble_model(c("linear_regression", "random_forest_regression"),
                                c("regression", "regression"),
                                list(list(), list(ntree = 500)),
                                X,
                                y)
  expect_is(predictions, "numeric")
  expect_length(predictions, nrow(X))
})

# Test ensemble_model function for linear and random forest regressipn
test_that("ensemble_model function combines predictions correctly", {
  predictions <- ensemble_model(c("linear_regression", "lasso_regression"),
                                c("regression", "regression"),
                                list(list(), list(lambda = 0.01)),
                                X,
                                binary_y)
  expect_is(predictions, "numeric")
  expect_length(predictions, nrow(X))
})

# Test ensemble_model function for lasso regression and svm_regression
test_that("ensemble_model function combines predictions correctly", {
  predictions <- ensemble_model(c("lasso_regression", "svm_regression"),
                                c("regression", "regression"),
                                list(list(), list(kernel = 'linear')),
                                X,
                                binary_y)
  expect_is(predictions, "numeric")
  expect_length(predictions, nrow(X))
})

# Test ensemble_model function for elastic net and random forest
test_that("ensemble_model function combines predictions correctly", {
  predictions <- ensemble_model(c("xgboost_regression", "random_forest_regression"),
                                c("regression", "regression"),
                                list(list(), list()),
                                X,
                                y)
  expect_is(predictions, "numeric")
  expect_length(predictions, nrow(X))
})

# Test ensemble_model function for elastic net and random forest
test_that("ensemble_model function combines predictions correctly", {
  predictions <- ensemble_model(c("linear_regression", "xgboost_regression"),
                                c("regression", "regression"),
                                list(list(), list()),
                                X,
                                binary_y)
  expect_is(predictions, "numeric")
  expect_length(predictions, nrow(X))
})
