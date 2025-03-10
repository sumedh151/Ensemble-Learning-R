#' Perform Logistic Regression
#'
#' This function performs logistic regression.
#'
#' @param X Matrix of predictors/independent variables.
#' @param y Response variable (binary).
#' @return List containing coefficients, fitted values, and model summary.
#' @export
logistic_regression <- function(X, y) {
  if (!is.numeric(y) || length(unique(y)) != 2) {
    stop("Response variable y must be binary for logistic regression.")
  }

  # Convert y to a factor with levels 0 and 1
  y <- factor(y)

  fit <- glm(y ~ X, family = binomial(link = "logit"))
  coefficients <- coef(fit)
  fitted_values <- fitted(fit)
  summary <- summary(fit)

  result <- list(coefficients = coefficients,
                 fitted_values = fitted_values,
                 summary = summary)
  return(result)
}
