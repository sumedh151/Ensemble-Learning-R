\name{svm_regression}
\alias{svm_regression}
\title{Perform Support Vector Machine (SVM) Regression}
\usage{
svm_regression(X, y, kernel = "linear")
}
\arguments{
  \item{X}{Matrix of predictors/independent variables.}

  \item{y}{Response variable.}

  \item{kernel}{Kernel function to be used. Default is "linear".}
}
\description{
This function performs Support Vector Machine regression.
}
\details{
The SVM regression model is fitted using the svm function from the e1071 package.

If y is binary, binary classification is done by default.
}
\examples{
# Generate some example data
set.seed(123)
X <- matrix(rnorm(100), ncol = 2)
y <- rnorm(50)

# Perform SVM regression
result <- svm_regression(X, y)
}
