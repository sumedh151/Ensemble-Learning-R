\name{ridge_regression}
\alias{ridge_regression}
\title{Perform Ridge Regression}
\usage{
ridge_regression(X, y, lambda)
}
\arguments{
  \item{X}{Matrix of predictors/independent variables.}

  \item{y}{Response variable.}

  \item{lambda}{Ridge parameter.}
}
\description{
This function performs ridge regression.
}
\details{
The ridge regression model is fitted using the glmnet::glmnet function from the glmnet package.

If y is binary, binary classification is done by default.
}
\examples{
# Generate some example data
set.seed(123)
X <- matrix(rnorm(100), ncol = 2)
y <- rnorm(50)
lambda <- 0.1

# Perform ridge regression
result <- ridge_regression(X, y, lambda)
}
