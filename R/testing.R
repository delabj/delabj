# library(ggplot2)
#
# df <- data.frame(x = factor(rep(letters[1:5], each = 10)), y = rnorm(50), color=(rep(c("A", "B", "C", "B", "A"), each=10)))
# plot <- ggplot(df, aes(x = x, y = y, color=color)) + geom_jitter()
#
# plot + ggtitle("No theme")
#
# plot + theme_delabj()+
#   ggtitle("theme_delabj()")+
#   scale_color_delabj()
#
#
#
# plot2 <- ggplot(df, aes(x=color, fill= x))+geom_bar()
#
#
# plot2 +ggtitle("No Theme")
#
# plot2 + ggtitle("theme_delabj()")+
#   theme_delabj()+
#   scale_fill_zune()
#
#
# plot3 <- ggplot(df, aes(x=x, y=y, color=y^2-y^3+y))+
#   geom_point(size=2)+
#   theme_delabj()+
#   scale_color_zune()
#
# devtools::install_github("tidyverse/ggplot2")
