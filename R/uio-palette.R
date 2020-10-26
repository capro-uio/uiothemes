uio_colors <- c(
  red   = "#ff0000",
  white = "#ffffff",
  black = "#000000",
  grey1 = "#d7d2cb",
  grey5 = "#b8ab9e"
)

#' Function to extract uio colours as hex codes
#'
#' @param ... Character names of uio_colors
#' @export
uio_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return (uio_colors)

  cols <- match.arg(cols,
                    names(uio_colors),
                    several.ok = TRUE)

  uio_colors[cols]
}

uio_palettes <- list(
  `main`     = uio_cols("black", "red", "white"),

  `bw`       = uio_cols("black", "white"),

  `greys`    = uio_cols("grey1", "grey5"),

  `redwhite` = uio_cols("red", "white"),

  `redblack` = uio_cols("red", "black")
)

#' Return function to interpolate a uio color palette
#'
#' @param palette Character name of palette in uio_palettes
#' @param reverse Logical indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to \code{\link[grDevices]{colorRampPalette}}
#' @export
uio_pal <- function(palette = "redblack", reverse = FALSE, ...) {
  palette <- match.arg(palette, names(uio_palettes))

  pal <- uio_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  grDevices::colorRampPalette(pal, ...)
}
