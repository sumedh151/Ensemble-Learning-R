#' Ensemble Model
#'
#' Fits multiple models on the same dataset and combines their predictions.
#'
#' @param models A list of model names.
#' @param types A list of model types corresponding to each model.
#' @param params A list of parameters corresponding to each model.
#' @param X The feature matrix.
#' @param y The target variable.
#' @return Combined predictions from all models.
#' @examples
#' ensemble_model(c("linear_regression", "random_forest_regression"),
#'                c("regression", "regression"),
#'                list(list(), list(ntree = 500)),
#'                X_train, y_train)

ensemble_model <- function(models, types, params, X, y) {
  predictions <- list()
  for(i in seq_along(models)) {
    model_name <- models[[i]]
    model_type <- types[[i]]
    model_params <- params[[i]]

    if(model_type == "regression") {
      if(model_name == "linear_regression") {
        fit <- linear_regression(X, y)
        predictions[[length(predictions) + 1]] <- fit$fitted_values
      } else if(model_name == "lasso_regression") {
        lambda <- ifelse("lambda" %in% names(model_params), model_params[["lambda"]], 0.01)
        fit <- lasso_regression(X, y, lambda)
        predictions[[length(predictions) + 1]] <- fit$fitted_values
      } else if(model_name == "ridge_regression") {
        lambda <- ifelse("lambda" %in% names(model_params), model_params[["lambda"]], 0.01)
        fit <- ridge_regression(X, y, lambda)
        predictions[[length(predictions) + 1]] <- fit$fitted_values
      } else if(model_name == "random_forest_regression") {
        ntree <- ifelse("ntree" %in% names(model_params), model_params[["ntree"]], 500)
        fit <- random_forest_regression(X, y, ntree)
        predictions[[length(predictions) + 1]] <- fit$predictions
      }else if(model_name == "elastic_net") {
        nfolds <- ifelse("nfolds" %in% names(model_params), model_params[["nfolds"]], 5)
        fit <- elastic_net(X, y, nfolds=nfolds)
        predictions[[length(predictions) + 1]] <- fit$fitted_values
      }else if(model_name == "svm_regression") {
        kernel <- ifelse("kernel" %in% names(model_params), model_params[["kernel"]], 'linear')
        fit <- svm_regression(X, y, kernel)
        predictions[[length(predictions) + 1]] <- fit$predictions
      }else if(model_name == "xgboost_regression") {
        nrounds <- ifelse("nrounds" %in% names(model_params), model_params[["nrounds"]], 100)
        fit <- xgboost_regression(X, y, nrounds)
        predictions[[length(predictions) + 1]] <- fit$predictions
      }
    }
    #else if(model_type == "classification") {
    #  if(model_name == "svm_regression") {
    #    kernel <- ifelse("kernel" %in% names(model_params), model_params[["kernel"]], 'linear')
    #    fit <- svm_regression(X, y, kernel)
    #    predictions[[length(predictions) + 1]] <- fit$predictions
    #  }
    #}

  }
  return(sapply(seq_along(predictions[[1]]), function(i) mean(sapply(predictions, "[[", i))))
}



