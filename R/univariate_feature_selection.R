#' Univariate Feature Selection
#'
#' This function performs univariate feature selection based on either Pearson Correlation Coeff for regression or Bi-serial Correlation Coeff for binary classification.
#'
#' @param X A matrix of predictor variables.
#' @param y A vector of target variable.
#' @param K Number of top predictors to select.
#' @return A character vector containing the names of the top K predictors.
#' @examples
#' X <- matrix(rnorm(100 * 10), ncol = 10)
#' y <- rnorm(100)
#' top_predictors <- univariate_feature_selection(X, y, K = 3)
#' @export
univariate_feature_selection <- function(X, y, K) {

  col_names_flag <- FALSE
  if (is.null(colnames(X))) {
    colnames(X) <- paste0("V", 1:ncol(X))
    col_names_flag <- TRUE
  }

  if(is.factor(y)) {
    # If y is binary, use Point-Biserial Correlation Coefficient
    cor_values <- apply(X, 2, function(x) cor(x, as.numeric(y), method = "pearson"))
  } else {
    # If y is continuous, use Pearson's Correlation Coefficient
    cor_values <- apply(X, 2, function(x) cor(x, y, method = "pearson"))
  }

  ordered_features <- order(abs(cor_values), decreasing = TRUE)

  top_features <- names(cor_values)[ordered_features[1:K]]

  selected_data <- X[, top_features]

  if(col_names_flag == TRUE){
    colnames(selected_data) <- NULL
  }

  return(selected_data)
}
