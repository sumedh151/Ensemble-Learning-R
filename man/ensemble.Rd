\name{ensemble_model}
\alias{ensemble_model}
\title{Ensemble Model}
\usage{
  ensemble_model(models, types, params, X, y)
}
\arguments{
  \item{models}{A list of model names.}

  \item{types}{A list of model types corresponding to each model.}

  \item{params}{A list of optional parameters corresponding to each model.
      ntree(Number of trees) for random forest - Set to 500 on default.
      nrounds(Number of round) for xgboost - Set to 100 on default.
      lambda for random forest - Set to 0.01 on default.
      kernal for svm regression - Set to linear on default.
      nfolds(Number of folds for cross validation) for elastic net - Set to 5 on default.
  }

  \item{X}{The feature matrix.}

  \item{y}{The target variable.}
}
\description{
  Fits multiple models on the same dataset and combines their predictions into a single value using averaging.
}
\examples{

# Create test data
set.seed(123)
X_train <- matrix(rnorm(100), ncol = 2)
y_train <- rnorm(50)

ensemble_model(c("linear_regression", "random_forest_regression"),
               c("regression", "regression"),
               list(list(), list(ntree = 500)),
               X_train, y_train)
}
