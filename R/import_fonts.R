#' Import Fonts for Use in Plots and Charts
#'
#' @description
#'
#' A function to load the Poppins font for ease of use.
#'
#'
#' @usage
#' import_poppins()
#' import_source_code_pro()
#'
#'
#'
import_poppins <- function() {

  rc_font_dir <- system.file("fonts", "Poppins", package="delabj")

  suppressWarnings(suppressMessages(extrafont::font_import(rc_font_dir, prompt=FALSE)))

  message(
    sprintf(
      "You will likely need to install these fonts on your system as well.\n\nYou can find them in [%s]",
      rc_font_dir)
  )

}

import_source_code_pro <- function() {

  rc_font_dir <- system.file("fonts", "Source_Code_Pro", package="delabj")

  suppressWarnings(suppressMessages(extrafont::font_import(rc_font_dir, prompt=FALSE)))

  message(
    sprintf(
      "You will likely need to install these fonts on your system as well.\n\nYou can find them in [%s]",
      rc_font_dir)
  )

}


import_open_sans <- function() {

  rc_font_dir <- system.file("fonts", "open_sans", package="delabj")

  suppressWarnings(suppressMessages(extrafont::font_import(rc_font_dir, prompt=FALSE)))

  message(
    sprintf(
      "You will likely need to install these fonts on your system as well.\n\nYou can find them in [%s]",
      rc_font_dir)
  )

}
