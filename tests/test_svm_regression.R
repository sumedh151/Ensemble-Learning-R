library(testthat)
library(simpleEnsembleGroup16)

# Create test data for continuous y
set.seed(123)
X_continuous <- matrix(rnorm(100), ncol = 2)
y_continuous <- rnorm(50)

# Create test data for binary y
X_binary <- matrix(rnorm(100), ncol = 2)
y_binary <- sample(c(0, 1), 50, replace = TRUE)

# Test svm_regression function for continuous y
test_that("svm_regression function works for continuous y", {
  result_continuous <- svm_regression(X_continuous, y_continuous)
  expect_true("predictions" %in% names(result_continuous))
  expect_true("model" %in% names(result_continuous))
})

# Test svm_regression function for binary y
test_that("svm_regression function works for binary y", {
  result_binary <- svm_regression(X_binary, y_binary)
  expect_true("predictions" %in% names(result_binary))
  expect_true("model" %in% names(result_binary))
})
