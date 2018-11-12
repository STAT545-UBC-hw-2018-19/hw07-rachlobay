#' Box-Cox Transform Function
#'
#' Given a variable, the Box-Cox power transformation is obtained.
#'
#' @param x vector that is to be transformed under the box-cox function.
#' @param lambda strength of the transformation. Default is 0. May be a single value or a vector for this function.
#' @param makepos the constant value that should be added to each `x`  to make them positive. Default is 0.
#'
#' @return A vector of the values that have been transformed. If lambda is a 0 value, returns the `log(x)`. If lambda is non-0 value, returns `(x^lamba - 1) / lambda`. When lambda is a vector, a marrix of values that were transformed with each column of the matrix corresponds to a lambda.
#' @export

boxcox.transform <- function(x, lambda = 0, makepos = 0) {
# Common error checks
    if(any(x < 0)) stop("Negative x-value(s). Change makepos argument of function to add a constant to make all x values positive.")
    if((makepos < 0)) stop("Nice try, but makepos value must be non-negative.")

# Box-Cox Function Computations
    if(length(lambda) != 1) return(boxcox.tranform.mat(x, lambda))
    else{
        if(lambda == 0) return((log(x)))
        else return(((x^lambda - 1) / lambda))
    }
}
