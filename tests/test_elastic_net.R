library(testthat)
library(simpleEnsembleGroup16)

# Create test data for continuous y
set.seed(123)
X_continuous <- matrix(rnorm(100), ncol = 2)
y_continuous <- rnorm(50)

# Create test data for binary y
X_binary <- matrix(rnorm(100), ncol = 2)
y_binary <- sample(c(0, 1), 50, replace = TRUE)
nfolds = 5

# Test elastic_net function for continuous y
test_that("elastic_net function works for continuous y", {
  result_continuous <- elastic_net(X_continuous, y_continuous, nfolds)
  expect_true("coefficients" %in% names(result_continuous))
  expect_true("fitted_values" %in% names(result_continuous))
  expect_true("summary" %in% names(result_continuous))
})

# Test elastic_net function for binary y
test_that("elastic_net function works for binary y", {
  result_binary <- elastic_net(X_binary, y_binary, nfolds)
  expect_true("coefficients" %in% names(result_binary))
  expect_true("fitted_values" %in% names(result_binary))
  expect_true("summary" %in% names(result_binary))
})
