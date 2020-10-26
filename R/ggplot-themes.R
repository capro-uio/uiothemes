#' ggplot themes for uio
#'
#' A selection of themes that fit with the
#' UiO branding instructions.
#'
#' @details
#' \itemize{
#'    \item{theme_uio} - base theme for UiO
#'    \item{theme_uio_dark} - dark/inverted version of base theme
#'    \item{theme_uio_void} - base theme without axis information or grid
#'    \item{theme_uio_darl_void} - dark/inverted theme without axis information or grid
#' }
#'
#' @param base_size text size
#' @export
#' @importFrom ggplot2 theme_grey theme '%+replace%'
#' @rdname themes_uio
#' @examples
#' \dontrun{
#' library(ggplot2)
#'
#' ggplot(mtcars, aes(mpg, disp, colour = cyl)) +
#'    geom_point(size = 5) +
#'    theme_uio()
#'
#' ggplot(mtcars, aes(mpg, disp, colour = cyl)) +
#'    geom_point(size = 5) +
#'    theme_uio_dark()
#'
#' ggplot(mtcars, aes(mpg, disp, colour = cyl)) +
#'    geom_point(size = 5) +
#'    theme_uio_void()
#'
#' ggplot(mtcars, aes(mpg, disp, colour = factor(cyl))) +
#'    geom_point(size = 5) +
#'    theme_uio_dark_void()
#'}
theme_uio <- function (base_size = 10) {
  theme_grey(base_size = base_size,
             base_family = uio_font()) %+replace%
    theme(
      line = uio_line(uio_cols("grey1")),
      text = uio_text(uio_cols("black")),
      title = element_text(family = uio_font("title")),

      panel.background  = uio_rect(),
      panel.grid = uio_line("grey95"),
      panel.grid.minor = uio_line("grey95",
                                   linetype = "longdash"),
      plot.background = uio_rect(),
      plot.subtitle = uio_text(uio_cols("black"),
                               fonttype = "title",
                               face = "italic", vjust = 1, hjust = 0),
      plot.title = element_text(family = uio_font("title"),
                                size = 15,
                                hjust = 0),

      axis.line = uio_line("grey60"),

      legend.background = uio_rect(),
      legend.key = uio_rect()
    )
}

#' @export
#' @importFrom ggplot2 theme '%+replace%'
#' @rdname themes_uio
theme_uio_dark <- function (base_size = 10) {
  theme_uio() %+replace%
    theme(
      line = uio_line(uio_cols("grey1")),
      text = uio_text(uio_cols("white")),
      panel.background  = uio_rect(uio_cols("black")),
      panel.grid = uio_line(uio_cols("grey5")),
      panel.grid.minor = uio_line(uio_cols("grey5"),
                                  linetype = "longdash"),
      plot.background = uio_rect(uio_cols("black")),
      plot.subtitle = uio_text(uio_cols("grey1"),
                               face = "italic", vjust = 1, hjust = 0),
      axis.line = uio_line(uio_cols("white")),
      axis.text = uio_text(uio_cols("grey1")),
      legend.background = uio_rect(),
      legend.key = uio_rect()
    )
}

# void themes ----

#' @export
#' @importFrom ggplot2 theme element_blank '%+replace%'
#' @rdname themes_uio

theme_uio_void <- function (base_size = 10) {
  theme_uio() %+replace%
    theme(
      panel.background  =  element_blank(),
      panel.grid = element_blank(),
      panel.grid.minor = element_blank(),
      plot.background = element_blank(),
      axis.line = element_blank(),
      axis.text = element_blank(),
      axis.title =  element_blank(),
      axis.ticks =  element_blank()
    )
}


#' @export
#' @importFrom ggplot2 theme element_blank '%+replace%'
#' @rdname themes_uio
theme_uio_dark_void <- function (base_size = 10) {
  theme_uio_dark() %+replace%
    theme(
      panel.grid = element_blank(),
      panel.grid.minor = element_blank(),
      axis.line = element_blank(),
      axis.text = element_blank(),
      axis.title = element_blank(),
      axis.ticks = element_blank()
    )
}

# elements ----
#' @importFrom ggplot2 element_text margin
uio_text <- function(colour = uio_cols("black"),
                      size = 10,
                      lineheight = 0.9,
                      hjust = 0.5,
                      vjust = 0.5,
                      angle = 0,
                      face = "plain",
                      fonttype = "body"){

  element_text(family = uio_font(fonttype),
               face = face,
               colour =  colour,
               hjust = hjust,
               vjust = vjust,
               angle = angle,
               size = size,
               lineheight = lineheight,
               margin = margin(),
               debug = FALSE)
}

#' @importFrom ggplot2 element_line
uio_line <- function(colour, linetype = "solid"){
  element_line(colour = colour,
               size = .6,
               linetype =  linetype,
               lineend = "round")
}

#' @importFrom ggplot2 element_rect
uio_rect <- function(fill = "transparent", colour = NA){
  element_rect(fill = fill, colour = colour)
}


#' UiO theme fonts
#'
#' Returns family name of UiO fonts, to
#' be used in plots. If for instance used the the
#' ggplot2-theme functions.
#'
#' @param type body or title font type
#'
#' @export
uio_font <- function(type = c("body", "title") ){

    type <- match.arg(type,
                      c("body", "title"))

    switch(type,
           "body" = "Arial",
           "title" = "Georgia")
}



