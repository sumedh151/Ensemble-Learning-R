#' Perform Lasso Regression
#'
#' This function performs Lasso regression.
#'
#' @param X Matrix of predictors/independent variables.
#' @param y Response variable.
#' @param lambda Lasso parameter.
#' @return List containing coefficients, fitted values, and model summary.
#' @export
lasso_regression <- function(X, y, lambda) {
  # Load the glmnet library
  library(glmnet)

  fit <- glmnet(x = X, y = y, alpha = 1, lambda = lambda)
  coefficients <- coef(fit)
  fitted_values <- predict(fit, newx = X)
  summary <- summary(fit)

  result <- list(coefficients = coefficients,
                 fitted_values = fitted_values,
                 summary = summary)
  return(result)
}
