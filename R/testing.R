# library(ggplot2)
# library(delabj)
#
# df <- data.frame(x = factor(rep(letters[1:5], each = 10)), y = rnorm(50), color=(rep(c("A", "B", "C", "B", "A"), each=10)))
# plot <- ggplot(df, aes(x = x, y = y, color=color)) + geom_jitter()
#
# plot + ggtitle("No theme")
#
# plot + theme_delabj()+
#   ggtitle("This is theme_delabj()")+
#   labs(subtitle = "This is text")
#   scale_color_delabj()
#
#
#
# plot2 <- ggplot(df, aes(x=color, fill= x))+geom_bar()
#
#
# plot2 +ggtitle("No Theme")
#
# plot2 + ggtitle("theme_delabj( )")+
#   theme_delabj()+
#   scale_fill_delabj()
#
# plot2 + ggtitle("theme_delabj_dark( )")+
#   theme_delabj_dark()+
#   scale_fill_delabj()
#
#
#
# plot3 <- ggplot(df, aes(x=x, y=y, color=y))+
#   geom_point(size=2)+
#   theme_delabj()+
#   scale_color_zune()+
#   ggtitle("Random Assortment of Values by letter")
#
#
# plot3
# devtools::install_github("tidyverse/ggplot2")
