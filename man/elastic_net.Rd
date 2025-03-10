\name{elastic_net}
\alias{elastic_net}
\title{Perform Elastice Net Regularization with cross validation}
\description{
  This function performs Linear regression using elastic net regularization
}
\usage{
  elastic_net(X, y, nfolds)
}
\arguments{
  \item{X}{Matrix of predictors/independent variables.}

  \item{y}{Response variable.}

  \item{nfolds}{Optional parameter to mention number of folds for cross validation. On default set to 5}
}
\details{
  The Elastic Net regularization is done using glmnet::glmnet function from the glmnet package with alpha varying from 0 to 1.

  Best value for alpha and lambda is identified through cross validation using cv.glmnet function, by increasing alpha stepwise from 0 to 1.

 If y is binary, binary classification is done by default.
}
\examples{
    # Generate some example data
    set.seed(123)
    X <- matrix(rnorm(100), ncol = 2)
    y <- rnorm(50)
    nfolds <- 5

    # Perform Elastic Net
    result <- elastic_net(X, y, nfolds)
}
