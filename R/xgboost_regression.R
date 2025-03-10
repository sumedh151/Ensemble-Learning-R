#' Perform XGBoost Regression
#'
#' This function performs XGBoost regression.
#'
#' @param X Matrix of predictors/independent variables.
#' @param y Response variable.
#' @param nrounds Number of boosting rounds.
#' @return List containing predictions and model object.
#' @export
xgboost_regression <- function(X, y, nrounds = 100) {
  # Load the xgboost package
  library(xgboost)

  fit <- xgboost(data = as.matrix(X), label = y, nrounds = nrounds)
  predictions <- predict(fit, newdata = as.matrix(X))

  result <- list(predictions = predictions, model = fit)
  return(result)
}
