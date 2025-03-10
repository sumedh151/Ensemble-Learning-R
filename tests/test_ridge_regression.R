library(testthat)
library(simpleEnsembleGroup16)

# Create test data for continuous y
set.seed(123)
X_continuous <- matrix(rnorm(100), ncol = 2)
y_continuous <- rnorm(50)
lambda <- 0.1

# Create test data for binary y
X_binary <- matrix(rnorm(100), ncol = 2)
y_binary <- sample(c(0, 1), 50, replace = TRUE)

# Test ridge_regression function for continuous y
test_that("ridge_regression function works for continuous y", {
  result_continuous <- ridge_regression(X_continuous, y_continuous, lambda)
  expect_true("coefficients" %in% names(result_continuous))
  expect_true("fitted_values" %in% names(result_continuous))
  expect_true("summary" %in% names(result_continuous))
})

# Test ridge_regression function for binary y
test_that("ridge_regression function works for binary y", {
  result_binary <- ridge_regression(X_binary, y_binary, lambda)
  expect_true("coefficients" %in% names(result_binary))
  expect_true("fitted_values" %in% names(result_binary))
  expect_true("summary" %in% names(result_binary))
})
