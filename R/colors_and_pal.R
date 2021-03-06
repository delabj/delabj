#' Set of colors for delabj
#'
#' @description
#' Simply a set of hex codes and names for colors I like
#'
#' @usage colors_delabj[name]
#'
#' @return Named characters of the hex code
colors_delabj <- c(
  'maroon' = '#721121',
  'mint' = '#83B692',
  'clear sky' = '#2660A4',
  'cantelope' = '#F19953',
  'plum' = '#5B3758',
  'zune pink' = '#E64E8D',
  'zune orange' = '#EE9537',
  'black' = "#000000",
  'retro orange' = "#FCB76D",
  'retro purple' = '#AC78BA',
  'retro green' = '#008F9B',
  'meteora highlight' = "#A69174",
  'meteora main' = "#12100D",
  'meteora grey' = "#848484",
  'meteora alt grey' = "#847C7C"

)

#' Retrieve colors from delabj colors
#'
#' @description
#' A function to retrieve a list of colors from the list of named colors in delabj_colors
#'
#' @usage  get_delabj_colors(color1, color2)
#'
#' @value ... name of colors in colors_delabj
#'
#' @returns
#' a set of named characters
#'
#' @examples
#' get_delabj_colors('plum', 'mint', 'zune pink')
get_delabj_colors <- function(...){
  cols <- c(...)

  if(is.null(cols))
    return(colors_delabj)

  return(colors_delabj[cols])
}


#' Delabj Color Pallets
#'
#' @description
#' A collection of pallets I use
#'
#' @usage palettes_delabj[pallet_name]
palettes_delabj <- list(
  'main' = get_delabj_colors('maroon', 'plum', 'clear sky', 'cantelope', 'mint'),
  'zune' = get_delabj_colors('black', 'zune pink', 'zune orange'),
  'retro' = get_delabj_colors('retro orange', 'retro purple', 'retro green')
)


#' Retrieve Delabj color palettes
#'
#' @description
#' Easily retrieve various palettes from the delabj collection.

get_delabj_palettes <- function(palette = "main", reverse = FALSE, ...) {
  pal <- palettes_delabj[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)
}


#' Change color to one of delabj's palettes
#'
#' @description Custom color scale to use the delabj palettes.
#' @usage get_delabj_palettes(palette="main", reverse=  F, ...)
#'
#' @param palette Name of the palette (main, zune, retro)
#' @param reverse Boolean: should the palette be reversed
#' @export
scale_color_delabj <- function(palette = 'main', discrete= TRUE, reverse = FALSE, ...){
  pal <- get_delabj_palettes(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("colour", paste0("delabj", palette), palette = pal, ...)
  } else {
    ggplot2::scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Change fill to one of delabj's palettes
#'
#' @description Custom color scale to use the delabj palettes.
#' @usage get_delabj_palettes(palette="main", reverse=  F, ...)
#'
#' @param palette Name of the palette (main, zune, retro)
#' @param reverse Boolean: should the palette be reversed
#' @export
scale_fill_delabj <- function(palette = 'main', discrete= TRUE, reverse = FALSE, ...){
  pal <- get_delabj_palettes(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("fill", paste0("delabj", palette), palette = pal, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}


#' A dedicated continuous palette for the zune colors
#'
#' @description Dedicated continuous scale using the zune colors.
#' The Zune was a mp3 player by Microsoft, with a distinctive gradient at the time. I was always a big fan of it and it makes a fairly nice continous scale as well.
#' @usage scale_color_zune(...)
#'
#' @export
scale_color_zune <- function( ...){
  pal <- get_delabj_palettes(palette = 'zune', reverse = FALSE)


  ggplot2::scale_color_gradientn(colours = pal(256), ...)

}
scale_fill_zune <- function( ...){
pal <- get_delabj_palettes(palette = 'zune', reverse = FALSE)


  ggplot2::scale_fill_gradientn(colours = pal(256), ...)

}



