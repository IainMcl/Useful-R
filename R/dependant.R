#' Dependant
#'
#' Plots a line using ggplot2.
#' Within a package library(...) or require(...) are not used.
#'
#' Dependant packages are added in the DESCRIPTION package file
#' Imports:
#'    ggplot2 (>= 3.3.3)
#'
#' @return None
#' @export
#'
#' @examples
#' dependant()
#' # Plots line in viewer.
dependant <- function(){
    x = c(1,2,3,4)
    y = c(1,2,3,4)
    data = data.frame(x, y)
    p = ggplot(data, aes(x = x, y = y)) + geom_line()
    p
}
