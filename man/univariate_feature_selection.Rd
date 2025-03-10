\name{univariate_feature_selection}
\alias{univariate_feature_selection}
\title{Univariate Feature Selection}
\usage{
  univariate_feature_selection(X, y, K)
}
\arguments{
  \item{X}{A matrix of predictor variables.}
  \item{y}{A vector of target variable.}
  \item{K}{Number of top predictors to select.}
}
\description{
  This function performs univariate feature selection based on Pearson Correlation Coefficient for regression or Point-Biserial Correlation Coefficient for binary classification and returns selected features data
}
\examples{
  n <- 50
  p <- 1000
  X <- matrix(rnorm(n * p), nrow = n, ncol = p)
  y <- rnorm(n)
  selected_data <- univariate_feature_selection(X, y, K = 3)
}
\details{
  The function calculates the correlation between each predictor and the target variable and selects the top K predictors data based on their absolute correlation values.
}
\value{
  A character vector containing the names of the top K predictors.
}
\author{
  [Your Name]
}
\seealso{
  \code{\link{cor}}, \code{\link{apply}}
}
\keyword{regression}
\keyword{classification}
\keyword{feature selection}
