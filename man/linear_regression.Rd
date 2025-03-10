\name{linear_regression}
\alias{linear_regression}
\title{Perform Linear Regression}
\usage{
linear_regression(X, y)
}
\arguments{
  \item{X}{Matrix of predictors/independent variables.}

  \item{y}{Response variable.}
}
\description{
This function performs linear regression using ordinary least squares method.
}
\details{
The linear regression model is fitted using the lm function from the stats package.
}
\examples{
# Generate some example data
set.seed(123)
X <- matrix(rnorm(100), ncol = 2)
y <- rnorm(50)

# Perform linear regression
result <- linear_regression(X, y)
}
