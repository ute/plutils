# splot - stylist plot

#'@title Plot with styles
#'@description Plot using predefined parameter lists
#'@param x an object that belongs to a class with \code{plot} method.
#'@param ... plot parameters, may be wrapped in \code{\link{simplist}}s.
#'@param .NULL.rm logical. If \code{TRUE}, ignore parameters with value \code{NULL}.
#'@param .plotmethod character naming a function, defaults to \code{"plot"}.
#'@details The function calls the \code{plot}-method of \code{x}, with arguments
#' given in \code{...}. Any \code{\link{simplist}}s contained in the arguments are
#' unwrapped. If arguments with the same name appear in the list, the last one
#' is taken.
#'
#' ! Note: Don't use this function inside a plot method, or any other method that
#' might be called with \code{splot} !
#'@author Ute Hahn,  \email{ute@@imf.au.dk}
#'@export
#'@examples
#'boldly <- simplist(col = "red", lwd = 5)
#'timidly <- simplist(col = "gray", lwd = 0.5, lty = "dashed")
#'
#'splot(sin, boldly, to = pi, ylim = c(-1,1))
#'splot(cos, timidly, add = TRUE, to = pi)
#'
#'# the last one wins:
#'splot(sin, boldly, timidly)
#'splot(sin, timidly, boldly, col = "green")

splot <- function(x, ..., .NULL.rm = TRUE, .plotmethod = "plot") {
  if (length(list(...)) == 0)
    do.call(.plotmethod, list(x))
  else{
    plotargs <- simplist(..., .NULL.rm = .NULL.rm)
    do.call(.plotmethod, c(list(x), plotargs, recursive = F))
  }
}