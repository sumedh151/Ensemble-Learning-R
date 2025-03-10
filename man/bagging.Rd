\name{bagging}
\alias{bagging}
\title{Perform Bagging for Regression Models}
\usage{
  bagging(model, X, y, R, n, ...)
}
\arguments{
  \item{model}{A character string specifying the regression model to use. Supported values are "linear_regression", "logistic_regression", "ridge_regression", "lasso_regression", "random_forest_regression", "xgboost_regression", and "svm_regression".}
  \item{X}{The matrix of predictors.}
  \item{y}{The response variable.}
  \item{R}{Number of bagging iterations.}
  \item{n}{Number of samples.}
  \item{...}{Additional arguments to pass to the regression model function.}
}
\description{
  Perform bagging for a given regression model. Bagging is a technique that involves sampling with replacement from the dataset and fitting multiple models on the sampled data. This function averages the predictions from these models to improve robustness.
}
\details{
  This function performs bagging for a given regression model by sampling with replacement from the dataset R times. For each iteration, a subset of the data is sampled, and the chosen regression model is fitted on the sampled data. Predictions are then made on the full dataset using each of the fitted models, and the final predicted values are obtained by averaging these predictions.
}
\examples{
  # Example usage with linear regression
  set.seed(123)
  X <- matrix(rnorm(100 * 5), ncol = 5)
  beta <- rnorm(5)
  y <- rnorm(100)

  bagging_result <- bagging("linear_regression", X, y, 100, 100)
}
