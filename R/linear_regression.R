#' Perform Linear Regression
#'
#' This function performs linear regression using ordinary least squares method.
#'
#' @param X Matrix of predictors/independent variables.
#' @param y Response variable.
#' @return List containing coefficients, residuals, fitted values, and model summary.
#' @export
linear_regression <- function(X, y) {
  fit <- lm(y ~ X)
  coefficients <- coef(fit)
  residuals <- resid(fit)
  fitted_values <- fitted(fit)
  summary <- summary(fit)

  result <- list(coefficients = coefficients,
                 residuals = residuals,
                 fitted_values = fitted_values,
                 summary = summary)
  return(result)
}
