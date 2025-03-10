\name{logistic_regression}
\alias{logistic_regression}
\title{Perform Logistic Regression}
\usage{
logistic_regression(X, y)
}
\arguments{
  \item{X}{Matrix of predictors/independent variables.}

  \item{y}{Response variable (binary).}
}
\description{
This function performs logistic regression.
}
\details{
The logistic regression model is fitted using the glm function from the stats package with family=binomial(link = "logit").
}
\examples{
# Generate some example data
set.seed(123)
X <- matrix(rnorm(100), ncol = 2)
y <- sample(c(0, 1), 50, replace = TRUE)

# Perform logistic regression
result <- logistic_regression(X, y)
}
