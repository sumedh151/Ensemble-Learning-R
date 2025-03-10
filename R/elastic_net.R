#' Perform Elastic net
#'
#' This function performs Elastic net.
#'
#' @param X Matrix of predictors/independent variables.
#' @param y Response variable.
#' @param nfolds Optional parameter to specify number of folds
#' @return List containing coefficients, fitted values, and model summary.
#' @export
elastic_net <- function(X, y, nfolds = 5){
  #load the glmnet library
  library(glmnet)

  mse <- 2
  alpha<- 0
  lambda <- 0.01
  for( i in seq(0, 1, by = 0.1)){
    fit <- cv.glmnet(X,y, alpha=i, nfolds = nfolds)

    lambda_1se <- fit$lambda.1se

    if(mse > fit$cvm[fit$lambda == lambda_1se]){
      mse <- fit$cvm[fit$lambda == lambda_1se]
      lambda <- lambda_1se
      alpha <- i
    }
  }

  #fit the model with best alpha and lambda
  fit <- glmnet(X,y, alpha=alpha, lambda=lambda)
  coefficients <- coef(fit)
  fitted_values <- predict(fit, newx = X)
  summary <- summary(fit)

  result <- list(coefficients = coefficients,
                 fitted_values = fitted_values,
                 summary = summary)
  return(result)
}





