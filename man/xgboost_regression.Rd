\name{xgboost_regression}
\alias{xgboost_regression}
\title{Perform XGBoost Regression}
\usage{
xgboost_regression(X, y, nrounds = 100)
}
\arguments{
  \item{X}{Matrix of predictors/independent variables.}

  \item{y}{Response variable.}

  \item{nrounds}{Number of boosting rounds. Default is 100.}
}
\description{
This function performs XGBoost regression.
}
\details{
The XGBoost regression model is fitted using the xgboost::xgboost function.

If y is binary, binary classification is done by default.
}
\examples{
# Generate some example data
set.seed(123)
X <- matrix(rnorm(100), ncol = 2)
y <- rnorm(50)

# Perform XGBoost regression
result <- xgboost_regression(X, y)
}
