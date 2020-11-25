#' A Blueprint Inspired Theme
#' @rdname delabj_themes
#' @export
theme_blueprint <- function(
  font = "Helvetica",
  title_font = "Helvetica",
  main.text.color = "white",
  sub.text.color = "#a7bfd3",
  base.size = 15,
  plot.background.color = "#265c88",
  legend.position = "top",
  panel.border.color = "#265c88",
  panel.background = "#265c88",
  panel.grid.color = "#a7bfd3",
  axis.text.color = "#a7bfd3",
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
                                         color ="#82a9cc")

  th$plot.caption = ggplot2::element_text(
    size = subtitle.size * .8,
    hjust = 1,
    vjust = 1,
    margin = ggplot2::margin(b=half_line),
    color ="#82a9cc",
    face = "plain"
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
  th$axis.line =ggplot2::element_line(
    colour = "white", arrow = grid::arrow(type = "closed", length = unit(0.125, "inches"))
  )

  #Grid lines
  #This removes all minor gridlines and adds major y gridlines. In many cases you will want to change this to remove y gridlines and add x gridlines. The cookbook shows you examples for doing so
  th$panel.grid.minor=ggplot2::element_line(color="#a7bfd3",
                                            size=0.125,
                                            linetype = "solid",
                                            lineend = "butt")
  th$panel.grid=ggplot2::element_line(color=panel.grid.color,
                                      size=0.25,
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



# mtcars %>% ggplot(aes(cyl))+geom_bar(color = "#82a9cc", fill = "#82a9cc", alpha=.75)+theme_blueprint()+labs(title = "Test Plot", subtitle = "Please Ignore", caption = "Sources say captions are important")

