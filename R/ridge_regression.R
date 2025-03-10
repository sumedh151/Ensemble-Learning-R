#' Perform Ridge Regression
#'
#' This function performs ridge regression.
#'
#' @param X Matrix of predictors/independent variables.
#' @param y Response variable.
#' @param lambda Ridge parameter.
#' @return List containing coefficients, fitted values, and model summary.
#' @export
ridge_regression <- function(X, y, lambda) {
  # Load the glmnet library
  library(glmnet)

  fit <- glmnet(x = X, y = y, alpha = 0, lambda = lambda)
  coefficients <- coef(fit)
  fitted_values <- predict(fit, newx = X)
  summary <- summary(fit)

  result <- list(coefficients = coefficients,
                 fitted_values = fitted_values,
                 summary = summary)
  return(result)
}
