library(testthat)
library(simpleEnsembleGroup16)

# Create some test data for continuous y
set.seed(123)
X_continuous <- matrix(rnorm(100), ncol = 2)
y_continuous <- rnorm(50)

# Create some test data for binary y
X_binary <- matrix(rnorm(100), ncol = 2)
y_binary <- sample(c(0, 1), 50, replace = TRUE)

# Test linear_regression function for continuous y
test_that("linear_regression function works for continuous y", {
  result_continuous <- linear_regression(X_continuous, y_continuous)
  expect_true("coefficients" %in% names(result_continuous))
  expect_true("residuals" %in% names(result_continuous))
  expect_true("fitted_values" %in% names(result_continuous))
  expect_true("summary" %in% names(result_continuous))
})

# Test linear_regression function for binary y
test_that("linear_regression function works for binary y", {
  result_binary <- linear_regression(X_binary, y_binary)
  expect_true("coefficients" %in% names(result_binary))
  expect_true("residuals" %in% names(result_binary))
  expect_true("fitted_values" %in% names(result_binary))
  expect_true("summary" %in% names(result_binary))
})
