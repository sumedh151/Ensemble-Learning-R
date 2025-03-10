\name{lasso_regression}
\alias{lasso_regression}
\title{Perform Lasso Regression}
\usage{
lasso_regression(X, y, lambda)
}
\arguments{
  \item{X}{Matrix of predictors/independent variables.}

  \item{y}{Response variable.}

  \item{lambda}{Lasso parameter.}
}
\description{
This function performs Lasso regression.
}
\details{
The Lasso regression model is fitted using the glmnet::glmnet function from the glmnet package with alpha=1.

If y is binary, binary classification is done by default.
}
\examples{
# Generate some example data
set.seed(123)
X <- matrix(rnorm(100), ncol = 2)
y <- rnorm(50)
lambda <- 0.1

# Perform Lasso regression
result <- lasso_regression(X, y, lambda)
}
