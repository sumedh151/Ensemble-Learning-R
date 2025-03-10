#' Perform Support Vector Machine (SVM) Regression
#'
#' This function performs Support Vector Machine regression.
#'
#' @param X Matrix of predictors/independent variables.
#' @param y Response variable.
#' @param kernel Kernel function to be used. Default is "linear".
#' @return List containing predictions and model object.
#' @export
svm_regression <- function(X, y, kernel = "linear") {
  fit <- e1071::svm(x = X, y = y, kernel = kernel)
  predictions <- predict(fit, X)

  result <- list(predictions = predictions, model = fit)
  return(result)
}
