#'  Operators
#'
#'  @description
#'  Use these operators to do logical comparisons that fit with the tidyverse style pipe aesthetic
#'  @param x a value
#'  @param y a value
#'  @examples
#'  # not in
#'  c(1,2,4) %!in% c(1,24,6,5)
#'
#'  # x or
#'  # indicates elementwise exclusive OR.
#'  TRUE %xor% TRUE
#'  # FALSE
#'
#'  FALSE %xor% FALSE
#'  # FALSE
#'
#'  FALSE %xor% TRUE
#'  # TRUE
#'  @rdname operators







#' Not In
#' @rdname operators
#' @export
`%!in%` <- function(x, y) {
  !(x %in% y)
}


`%not_in%` <- function(x, y) {
  !(x %in% y)
}


#' exclusive or
#' @rdname operators
#' @export
`%xor%`<- function(x, y){
  xor(x, y)
}
