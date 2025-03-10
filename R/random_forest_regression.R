#' Perform Random Forest Regression
#'
#' This function performs Random Forest regression.
#'
#' @param X Matrix of predictors/independent variables.
#' @param y Response variable.
#' @param ntree Number of trees to grow.
#' @return List containing predictions and model object.
#' @export
random_forest_regression <- function(X, y, ntree = 500) {
  #load the randomForest package
  library(randomForest)

  fit <- randomForest(x = X, y = y, ntree = ntree)
  predictions <- predict(fit, X)

  result <- list(predictions = predictions, model = fit)
  return(result)
}

