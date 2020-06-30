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
#' theme_delabj_dark has a dark grey background and dark gridlines.
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
#' #' @rdname delabj_themes


#' delabj dark mode
#' @rdname delabj_themes
#' @export
theme_delabj <- function(
  base_size = 12,
  base_family= "Poppins",
  title_font = "Open Sans",
  base_line_size=.5,
  base_rect_size = .5){
  half_line <- base_size*.5


  p <- ggplot2::theme_minimal(
    base_size = base_size,
    base_family = base_family,
    base_line_size = base_line_size,
    base_rect_size = base_rect_size
  ) %+replace%
    ggplot2::theme(
      plot.title = ggplot2::element_text(family=title_font,
                                         size = base_size * 1.33,
                                         face = "bold",
                                         hjust = 0,
                                         vjust = 1,
                                         margin = ggplot2::margin(b=half_line)),
      plot.title.position = "plot",
      plot.subtitle = ggplot2::element_text(family=base_family,
                                         hjust = 0,
                                         vjust = 1,
                                         margin = ggplot2::margin(b=half_line)),
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

  return(p)
}


#' delabj dark mode
#' @rdname delabj_themes
#' @export
theme_delabj_dark <- function(
  font = "Poppins",
  title_font = "Open Sans",
  main.text.color = "#D6D6D6",
  sub.text.color = "#D6D6D6",
  base.size = 15,
  plot.background.color = "#343E48",
  legend.position = "bottom",
  panel.border.color = "#343E48",
  panel.background = "#343E48",
  panel.grid.color = "#495866",
  axis.text.color = "#D6D6D6",
  axis.text.size = base.size * 0.67,
  subtitle.size = base.size * 0.9,
  legend.text = base.size * 0.6,
  legend.title = base.size * 0.93,
  axis.title.size = base.size * 0.8,
  title.size = 15
) {
  half_line <- base.size*.5
  th <- ggplot2::theme_minimal()

  #Text format:
  #This sets the font, size, type and color of text for the chart's title
  th$plot.title=ggplot2::element_text(family=title_font,
                                      face = "bold",
                                      size=title.size,
                                      color=main.text.color,
                                      hjust = 0,
                                      vjust = 1,
                                      margin = ggplot2::margin(b=half_line))
  th$plot.title.position = "plot"
  #This sets the font, size, type and colour of text for the chart's subtitle, as well as setting a margin between the title and the subtitle
  th$plot.subtitle=ggplot2::element_text(family=font,
                                         size=subtitle.size,
                                         hjust = 0,
                                         vjust = 1,
                                         margin = ggplot2::margin(b=half_line),
                                         color ="#D6D6D6")

  th$plot.caption = ggplot2::element_text(
                      size = subtitle.size,
                      hjust = 1,
                      vjust = 1,
                      margin = ggplot2::margin(b=half_line),
                      color ="#D6D6D6"
  )

  #Legend format
  #This sets the position and alignment of the legend, removes a title and backround for it and sets the requirements for any text within the legend. The legend may often need some more manual tweaking when it comes to its exact position based on the plot coordinates.
  th$legend.position = legend.position
  th$legend.text.align=0
  th$legend.background=ggplot2::element_blank()
  th$legend.key=ggplot2::element_blank()
  th$legend.text=ggplot2::element_text(family=font,
                                       size=legend.text,
                                       color=main.text.color)
  th$legend.title=ggplot2::element_text(family=font,
                                        size=legend.title,
                                        color=main.text.color)

  #Axis format
  #This sets the text font, size and colour for the axis test, as well as setting the margins and removes lines and ticks. In some cases, axis lines and axis ticks are things we would want to have in the chart - the cookbook shows examples of how to do so.
  th$axis.title.x=ggplot2::element_text(family=font,
                                        size=axis.title.size,
                                        color=main.text.color)
  th$axis.title.y=ggplot2::element_text(family=font,
                                        size=axis.title.size,
                                        color=main.text.color,
                                        angle = 90)

  th$axis.text=ggplot2::element_text(family=font,
                                     size=axis.text.size,
                                     color=main.text.color)

  th$axis.text.x=ggplot2::element_text(margin=ggplot2::margin(5, b=10))
  th$axis.text.y = ggplot2::element_text(margin=ggplot2::margin(l = 10))
  th$axis.ticks=ggplot2::element_blank()
  th$axis.line=ggplot2::element_blank()

  #Grid lines
  #This removes all minor gridlines and adds major y gridlines. In many cases you will want to change this to remove y gridlines and add x gridlines. The cookbook shows you examples for doing so
  th$panel.grid.minor=ggplot2::element_line(color="#3f4b57",
                                            size=0.5,
                                            linetype = "solid",
                                            lineend = "butt")
  th$panel.grid=ggplot2::element_line(color=panel.grid.color,
                                  size=0.5,
                                  linetype = "solid",
                                  lineend = "butt")
  #Blank background
  #This sets the panel background as blank, removing the standard grey ggplot background colour from the plot
  th$panel.background = ggplot2::element_rect(
    fill=panel.background,
    colour = NA
  )
  th$plot.background = ggplot2::element_rect(
    fill = plot.background.color,
    colour = NA
  )
  th$panel.border = ggplot2::element_rect(
    color = panel.border.color,
    fill = NA,
    linetype = "solid",
    size = 0.75
  )

  #Strip background (#This sets the panel background for facet-wrapped plots to white, removing the standard grey ggplot background colour and sets the title size of the facet-wrap title to font size 22)
  th$strip.background = ggplot2::element_rect(fill=panel.background)
  th$strip.text= ggplot2::element_text(colour = main.text.color,
                                       size  = 12,
                                       hjust = 0)

  return (th)
}



