#' Perform bagging for a given regression model
#'
#' @param model A character string specifying the regression model to use
#' @param X The matrix of predictors
#' @param y The response variable
#' @param R Number of bagging iterations
#' @param n Number of samples
#' @param additional_args Additional arguments to pass to the regression model function
#' @return A vector of averaged predicted values

bagging <- function(model, X, y, R, n, ...) {
  #n <- nrow(X)
  predictions <- matrix(0, nrow = n, ncol = R)

  for (i in 1:R) {
    # Sample with replacement
    indices <- sample(1:n, n, replace = TRUE)
    X_sampled <- X[indices, ]
    y_sampled <- y[indices]

    # Fit model on sampled data
    fitted_model <- switch(
      model,
      "linear_regression" = linear_regression(X_sampled, y_sampled, ...),
      "logistic_regression" = logistic_regression(X_sampled, y_sampled, ...),
      "ridge_regression" = ridge_regression(X_sampled, y_sampled, ...),
      "lasso_regression" = lasso_regression(X_sampled, y_sampled, ...),
      "elastic_net" = elastic_net(X_sampled, y_sampled, ...),
      "random_forest_regression" = random_forest_regression(X_sampled, y_sampled, ...),
      "xgboost_regression" = xgboost_regression(X_sampled, y_sampled, ...),
      "svm_regression" = svm_regression(X_sampled, y_sampled, ...),
      error = stop("Invalid model specified")
    )

    if(model %in% c("xgboost_regression", "random_forest_regression", "svm_regression")){
      predictions[, i] <- fitted_model$predictions
    }else if(model %in% c("linear_regression",
                          "lasso_regression",
                          "ridge_regression",
                          "elastic_net",
                          "logistic_regression")){
      predictions[, i] <- fitted_model$fitted_values
    }
  }
  # Average predictions
  averaged_predictions <- rowMeans(predictions)
  return(averaged_predictions)
}
