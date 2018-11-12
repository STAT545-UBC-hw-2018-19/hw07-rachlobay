#' Two Parameter Box-Cox Transform Function
#'
#' Given a variable, the two parameter Box-Cox power transformation is obtained.
#'
#' @param x vector that is to be transformed under the two paramter box-cox function. All x must be positive.
#' @param lambda1 power parameter. Default is 0. Must be a single value for this function.
#' @param lambda2 shift parameter in the two parameter Box-Cox power transformation. Default is 0. Must be a single value for this function.
#' @param makepos the constant value that should be added to each `x`  to make all x positive. Default is 0.
#'
#' @return A vector of the values that have been transformed. If lambda1 is a 0 value, returns the `log(x + lambda2)`. If lambda1 is non-0 value, returns `((x+lambda2)^lambda1 - 1) / lambda1`.
#' @export

two.param.boxcox.transform <- function(x, lambda1 = 0, lambda2 = 0, makepos = 0) {
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

    # Two Paramter Box-Cox Function Computations
    if(lambda1 != 0) return(((x+lambda2)^lambda1 - 1) / lambda1)
    else return(log(x + lambda2))
}
