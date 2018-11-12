#' Box-Cox Transform Function
#'
#' Given a variable, the Box-Cox power transformation is obtained.
#'
#' @param x vector that is to be transformed under the box-cox function. All x must be positive.
#' @param lambda strength of the transformation. Default is 0. May be a single value or a vector for this function.
#' @param makepos the constant value that should be added to each `x`  to make all x positive. Default is 0.
#'
#' @return A vector of the values that have been transformed. If lambda is a 0 value, returns the `log(x)`. If lambda is non-0 value, returns `(x^lamba - 1) / lambda`. When lambda is a vector, a matrix of values that were transformed with each column of the matrix corresponds to a lambda.
#' @export

boxcox.transform <- function(x, lambda = 0, makepos = 0) {
# Common error checks
    if((makepos < 0)) stop("Nice try, but makepos value must be non-negative.")

# Account for makepos parameter to add to each x to make 'em positive.
    if(any(x < 0)){
        x = x + makepos
    }

# Negative x-value automatic change of makepos argument to add the minimum constant to make all x values non-negative
    if(any(x < 0)){
        x = x + abs(min(x)) + 1
        warning("the minimum constant value was automatically added to each data value to make all data values positive.")
    }

# Box-Cox Function Computations
    if(length(lambda) != 1) return(boxcox.tranform.mat(x, lambda))
    else if(lambda != 0) return((x^lambda - 1) / lambda)
    else return(log(x))
}
