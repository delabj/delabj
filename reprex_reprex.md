``` r
library(ggplot2)

extrafont::font_import(paths = "fonts/",prompt = F)
#> Scanning ttf files in fonts/ ...
#> Extracting .afm files from .ttf files...
#> Error in data.frame(fontfile = ttfiles, FontName = "", stringsAsFactors = FALSE): arguments imply differing number of rows: 0, 1
extrafont::loadfonts(device = "win")
#> Registering font with R using windowsFonts(): Source Code Pro Black
#> Registering font with R using windowsFonts(): Source Code Pro
#> Registering font with R using windowsFonts(): Source Code Pro ExtraLight
#> Registering font with R using windowsFonts(): Source Code Pro Light
#> Registering font with R using windowsFonts(): Source Code Pro Medium
#> Registering font with R using windowsFonts(): Source Code Pro Semibold
#> Registering font with R using windowsFonts(): Poppins Black
#> Registering font with R using windowsFonts(): Poppins
#> Registering font with R using windowsFonts(): Poppins ExtraBold
#> Registering font with R using windowsFonts(): Poppins ExtraLight
#> Registering font with R using windowsFonts(): Poppins Light
#> Registering font with R using windowsFonts(): Poppins Medium
#> Registering font with R using windowsFonts(): Poppins SemiBold
#> Registering font with R using windowsFonts(): Poppins Thin

theme_delabj <- function(){
  ggplot2::theme_minimal(base_size=12, base_family = "Poppins",
                         base_line_size = .5, base_rect_size = .5 ) %+replace%
    theme(
      plot.title.position = "plot",
      legend.position = "bottom",
      plot.background = element_rect(fill="#F9F1F1", color = "#F9F1F1"),
      panel.grid.major = element_line(color="#D6D6D6",
                                      size=0.5,
                                      linetype = "solid",
                                      lineend = "butt"),
      panel.grid.minor = element_line(color="#F3F3F3",
                                      size=0.5,
                                      linetype = "solid",
                                      lineend = "butt")
      
      
    )
}

theme_delabj_dark <- function(){
  ggplot2::theme_minimal(base_size=12, base_family = "Poppins") %+replace%
    theme(
      
      plot.title = element_text(color="#D6D6D6"),
      axis.title = element_text(color="#D6D6D6"),
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
    )+
    theme(      plot.title.position = "plot")
}



df <- data.frame(x = factor(rep(letters[1:5], each = 10)), y = rnorm(50), color=(rep(c("A", "B", "C", "B", "A"), each=10)))
plot <- ggplot(df, aes(x = x, y = y, color=color)) + geom_jitter()



plot2 <- ggplot(df, aes(x=color, fill= x))+
  geom_bar()


plot2 +
  ggtitle("No Theme")
```

![](https://i.imgur.com/icwuS7z.png)

``` r

plot2 + 
  ggtitle("theme_delabj( )")+
  theme_delabj()
```

![](https://i.imgur.com/EV6nU56.png)

``` r

plot2 + 
  ggtitle("theme_delabj_dark( )")+
  theme_delabj_dark()
```

![](https://i.imgur.com/o3avCjn.png)

<sup>Created on 2020-03-09 by the [reprex package](https://reprex.tidyverse.org) (v0.3.0)</sup>
