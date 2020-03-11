# library(ggplot2)
# extrafont::font_import(paths = "fonts/",prompt = F)
# extrafont::loadfonts(device = "win")

#' My Prefered ggplot2 themes
#'
#' @description
#' A custom theme for ggplot2 based on theme_minimal(). A light and dark theme are both available.
#' @usage theme_delabj(
#' base_size =12,
#' base_family = "Poppins",
#' base_line_size = .5,
#' base_rect_size = .5)
#'
#' theme_delabj_dark(
#' base_size = 12,
#' base_family = "Poppins",
#' base_line_size = base_size/22,
#' base_rect_size = base_size/22)
#'
#' @param base_size base font size
#' @param base_family base font family (Poppins by default)
#' @param base_line_size base size for line elements
#' @param base_rect_size base size for rect elements
#'
#' @details theme_delabj has an off white background and light gridlines.
#' theme_delabj has a dark grey background and dark gridlines.
#'
#' @examples
#' ## Not Run
#' library(ggplot2)
#' df <- data.frame(x = factor(rep(letters[1:5], each = 10)), y = rnorm(50), color=(rep(c("A", "B", "C", "B", "A"), each=10)))
#' plot <- ggplot(df, aes(x = x, y = y, color=color)) + geom_jitter()
#'
#'
#' plot + theme_delabj
#'
#' plot + theme_delabj_dark

theme_delabj <- function(base_size = 12, base_family= "Poppins", base_line_size=.5, base_rect_size = .5){
  ggplot2::theme_minimal(
                          base_size = base_size,
                          base_family = base_family,
                          base_line_size = base_line_size,
                          base_rect_size = base_rect_size
                          ) %+replace%
    ggplot2::theme(
                  plot.title.position = "plot",
                  legend.position = "bottom",
                  plot.background = element_rect(fill="#F9F1F1", color = "#F9F1F1"),
                  panel.grid.major = element_line(
                                                  color="#D6D6D6",
                                                  size=0.5,
                                                  linetype = "solid",
                                                  lineend = "butt"
                                                  ),
                  panel.grid.minor = element_line(
                                                  color="#F3F3F3",
                                                  size=0.5,
                                                  linetype = "solid",
                                                  lineend = "butt"
                                                  )
                  )
}

theme_delabj_dark <- function(base_size = 12, base_family= "Poppins", base_line_size=.5, base_rect_size = .5){
  half_line <- base_size/2
  ggplot2::theme_minimal(base_size=base_size, base_family = base_family) %+replace%
    ggplot2::theme(
      plot.title = element_text(
        size = rel(1.2),
        hjust = 0,
        vjust = 1,
        margin = margin(b=half_line),
        color ="#D6D6D6"
                                ),
      plot.subtitle = element_text(
        size = rel(1.2),
        hjust = 0,
        vjust = 1,
        margin = margin(b=half_line),
        color ="#D6D6D6"
      ),
      plot.caption =  element_text(
        size = rel(1.2),
        hjust = 0,
        vjust = 1,
        margin = margin(b=half_line),
        color ="#D6D6D6"
      ),

      axis.title = element_text(color="#D6D6D6"),
      axis.text = element_text(color="#D6D6D6"),
      legend.text = element_text(color="#D6D6D6"),
      legend.title = element_text(color="#D6D6D6"),
      legend.position = "bottom",
      plot.background = element_rect(fill="#343E48", color = "#343E48"),

      panel.grid.major = element_line(color="#495866",
                                      size=0.5,
                                      linetype = "solid",
                                      lineend = "butt"),
      panel.grid.minor = element_line(color="#3f4b57",
                                      size=0.5,
                                      linetype = "solid",
                                      lineend = "butt"),
      plot.title.position = "plot"
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
  return(ggplot2::theme(panel.grid.minor = element_line(color=color,
                                               size=size,
                                               linetype = linetype,
                                               lineend = lineend)))
}

gridlines_major <- function(size = 0.5, color="#d6d6d6", linetype= "solid",
                            lineend = NULL, colour = NULL){
  if(!is.null(colour)){color <- colour}
  return(ggplot2::theme(panel.grid.major = element_line(color=color,
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
  return(ggplot2::theme(panel.grid.minor= element_blank(),
               panel.grid.major= element_blank()
  )
  )
}
gridlines_major_off <-function(){
  return(ggplot2::theme(panel.grid.major= element_blank()))
}
gridlines_minor_off <-function(){
  return(ggplot2::theme(panel.grid.minor= element_blank()))
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
  return(ggplot2::theme(legend.position = "none"))
}
legend_top <- function(){
  return(ggplot2::theme(legend.position = "top"))
}
legend_bottom <-function(){
  return(ggplot2::theme(legend.position = "bottom"))
}
legend_left <-function(){
  return(ggplot2::theme(legend.position = "left"))
}
legend_right <-function(){
  return(ggplot2::theme(legend.position = "right"))
}
