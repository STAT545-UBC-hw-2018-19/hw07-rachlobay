#' Inverse Box-Cox Transform Matrix of Values Function
#'
#' This function is to be used in an inverse boxcox.transform function to return a matrix of values that
#' underwent an inverse box-cox transform when lambda is a vector.
#' Each column of the matrix corresponds to a different lambda (and is named according to the lambda value).
#' I'm making it internal, because I don't want users to use it.
#' Rather, I want to use it in the inv.boxcox.transform function.
#'
#' @param x vector that is to be transformed under an inverse box-cox function.
#' @param lambda vector of values that indicate the strength of the inverse box-cox transformation.
#'
#' @return a matrix of the `x` values that underwent an inverse box-cox transformation for different lambdas. The entries of a column correspond to a particular lambda value. Hence, the columns are named to reflect what lambda value was used.
# Fill in the matrix of values with transformed values for each lambda.
inv.boxcox.tranform.mat <- function(x, lambda = 0) {
    values_mat = matrix(rep(x,length(lambda)), ncol = length(lambda)) # define a values matrix

    colnames(values_mat) <- paste(lambda)


for(i in 1:length(lambda)){
    if(lambda[i] != 0) values_mat[,i] = (lambda[i]*x + 1)^(1/lambda[i])
    else(values_mat[,i] = exp(x))
}
return(values_mat)
}
