library(ggplot2)
extrafont::loadfonts(device="win")

#' My Prefered ggplot2 theme
#'
#' @description
#' A custom theme with
theme_delabj <- function(){
  ggplot2::theme_minimal(base_size=12, base_family = "Inconsolata") %+replace%
  theme(
    plot.title.position = "plot",
    legend.position = "bottom",
    plot.background = element_rect(fill="#f9f1f1", color = "#f9f1f1"),
    panel.grid.major = element_line(color="#F3F3F3",
                                    size=0.5,
                                    linetype = "solid",
                                    lineend = "butt"),
    panel.grid.minor = element_line(color="#F3F3F3",
                                    size=0.5,
                                    linetype = "solid",
                                    lineend = "butt")


    )
}


#' Easily adjust ggplot2 gridlines
#'
#' @description
#' A simple function to easily adjust the ggplot gridlines.
#'  This acts as a wrapper for the theme elements and is a little more user friendly.
#'
#'  @usage
#'  gridlines_major(size = 0.5, color="#D6D6D6", linetype = "solid", lineend = NULL, colour =NULL )
#'  gridlines_minor(size = 0.5, color="#D6D6D6", linetype = "solid", lineend = NULL, colour =NULL )
#'
#'  @return
#'  A list with the ggplot theme changes. This can be added to a ggplot object.
#'
#'  @examples
#'  df <- data.frame(x = factor(rep(letters[1:3], each = 10)), y = rnorm(30), color=(rep(c("A", "B"), each=5)))
#'  ggplot(df, aes(x = x, y = y, color=color)) +
#'  geom_point()+
#'  gridlines_minor(size=4, color = "pink")

gridlines_minor <- function(size = 0.5, color="#d6d6d6",linetype= "solid",
                            lineend = NULL, colour = NULL){
  if(!is.null(colour)){color <- colour}
  return(theme(panel.grid.minor = element_line(color=color,
                                               size=size,
                                               linetype = linetype,
                                               lineend = lineend)))
}

gridlines_major <- function(size = 0.5, color="#d6d6d6", linetype= "solid",
                            lineend = NULL, colour = NULL){
  if(!is.null(colour)){color <- colour}
  return(theme(panel.grid.major = element_line(color=color,
                                                 size=size,
                                               linetype = linetype,
                                               lineend = lineend)))
}



#' Easily disable ggplot2 gridlines
#'
#' @description
#' Quick functions to enable faster and more readable theme adjustments to ggplot2 when removing gridlines
#' Functions to do this are as follows:
#' * 'gridlines_off' disables all gridlines for a given plot
#' * 'gridlines_major_off' disables all major gridlines for a plot
#' * 'gridlines_minor_of' disables all minor gridlines for a plot
#'
#' @usage
#' 'gridlines_off()'
#' 'gridlines_major_off()'
#' 'gridlines_minor_off()'
#'
#' @author
#' Joshua de la Bruere
#'
#' @examples
#' library(ggplot2)
#'
#' # Just major gridlines off
#' ggplot(mtcars, aes(x=mpg,y=hp))+
#'   geom_point()+
#'   gridlines_major_off()
#'
#' # Just minor gridlines off
#' ggplot(mtcars, aes(x=mpg,y=hp))+
#'  geom_point()+
#'  gridlines_minor_off()
#'
#' ## All gridlines off
#' ggplot(mtcars, aes(x=mpg,y=hp))+
#'  geom_point()+
#'  gridlines_off()

gridlines_off <-function(){
  return(theme(panel.grid.minor= element_blank(),
               panel.grid.major= element_blank()
  )
  )
}
gridlines_major_off <-function(){
  return(theme(panel.grid.major= element_blank()))
}
gridlines_minor_off <-function(){
  return(theme(panel.grid.minor= element_blank()))
}



#' Easily position the ggplot legend
#'
#' @description
#' Quick functions to enable faster and more readable theme adjustments to ggplot2 when positioning the legend
#' Functons provided are:
#' * 'legend_off' disables the legend for a plot
#' * 'legend_top' puts the legened in the top posistion
#' * 'legend_bottom' puts the legened in the bottom posistion
#' * 'legend_left' puts the legened in the left posistion
#' * 'legend_right' puts the legened in the top posistion
#'
#' @usage
#' 'legend_off()'
#' 'legend_top()'
#' 'legend_bottom()'
#' 'legend_left()'
#' 'legend_right()'
#'
#' @author
#' Joshua de la Bruere
#'
#' @examples
#' library(ggplot2)
#'
#' # Just major gridlines off
#' ggplot(mtcars, aes(x=mpg,y=hp, colour = wt))+
#'   geom_point()+
#'   legend_off()
#'
#' # Just minor gridlines off
#' ggplot(mtcars, aes(x=mpg,y=hp, colour = wt))+
#'  geom_point()+
#'  legend_top()
#'
#' ## All gridlines off
#' ggplot(mtcars, aes(x=mpg,y=hp, colour = wt))+
#'  geom_point()+
#'  legend_bottom()
#'
#'  # Legend position
legend_none <- function(){
  return(theme(legend.position = "none"))
}
legend_top <- function(){
  return(theme(legend.position = "top"))
}
legend_bottom <-function(){
  return(theme(legend.position = "bottom"))
}
legend_left <-function(){
  return(theme(legend.position = "left"))
}
legend_right <-function(){
  return(theme(legend.position = "right"))
}
