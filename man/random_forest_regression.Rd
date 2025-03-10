\name{random_forest_regression}
\alias{random_forest_regression}
\title{Perform Random Forest Regression}
\usage{
random_forest_regression(X, y, ntree = 500)
}
\arguments{
  \item{X}{Matrix of predictors/independent variables.}

  \item{y}{Response variable.}

  \item{ntree}{Number of trees to grow. Default is 500.}
}
\description{
This function performs Random Forest regression.
}
\details{
The Random Forest regression model is fitted using the randomForest::randomForest function.

If y is binary, binary classification is done by default.
}
\examples{
# Generate some example data
set.seed(123)
X <- matrix(rnorm(100), ncol = 2)
y <- rnorm(50)

# Perform Random Forest regression
result <- random_forest_regression(X, y)
}
