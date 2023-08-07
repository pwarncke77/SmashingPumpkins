#' Complete list of palettes
#'
#' Use \code{\link{pumpkins_palette}} to extract color palettes for a given length.
#'
#' @export
pumpkins_palettes <- list(
  gish = c("#A4505F", "#FA130B", "#FBFCB8",  "#F5D6E8", "#401026", "#E4D443", "#D7E2DE", "#240B11"),
  gish_dark = c("#E4D443", "#A4505F", "#FA130B", "#401026", "#240B11"),
  gish_light = c( "#FBFCB8", "#D7E2DE", "#F5D6E8", "#A4505F", "#401026"),
  simamese_dream = c("#F5F5F5", "#EC954E", "#69651C", "#B01709", "#792218", "#020F00", "#C34110", "#F0E6B1"),
  simamese_dream_dark = c("#B01709", "#69651C", "#792218", "#020F00"),
  simamese_dream_light = c("#F5F5F5", "#F0E6B1", "#EC954E", "#C34110"),
  simamese_dream_re = c("#F3711D", "#EB7AB0", "#CC382C", "#854786", "#303183"),
  mellon_collie = c("#5E798E", "#216683", "#EEB31B", "#0D3B53", "#53827C", "#405E5C", "#2B7748",
                    "#23342C", "#E33A35", "#9F3036", "#5C4E6F", "#2C4363", "#F7BB87", "#F8CA72",  "#BC8B49", "#FFFBCB"),
  mellon_collie_dark = c("#216683",  "#5C4E6F", "#0D3B53", "#405E5C", "#23342C", "#9F3036", "#EEB31B", "#BC8B49"),
  mellon_collie_light = c("#5E798E", "#216683",  "#5C4E6F",  "#53827C",  "#E33A35", "#F7BB87", "#F8CA72", "#FFFBCB"),
  adore = c("#FDFDF1", "#F7F2EF", "#E7DFD2", "#C5BBB2", "#7E746B", "#8C8278", "#463C3B", "#312726", "#151314"),
  zeitgeist = c("#E8222F", "#2F2526", "#E3E8D2", "#FFC51C", "#A53F33"),
  oceania = c("#BAF0FF", "#1E2956", "#1D345E", "#17527C", "#31769D", "#4A98AF", "#6BC1C0", "#70CCBF", "#49B5A5", "#3EB396", "#1F4E48", "#192523", "#0D1814"),
  cyr = c("#CEC3A5", "#BA7286", "#B06A6A", "#E9EADC", "#B5C096", "#78534B", "#4E3644", "#422D2C", "#B97351", "#201519")
  )

#' Colors from the Smashing Pumpkins Album Covers for data visualization
#'
#' Modeled after karthik/wesanderson (https://github.com/karthik/wesanderson), this
#' package contains color schemes used in the most iconic album covers by The Smashing Pumpkins.
#'
#'
#' @param n Number of colors desired.
#' @param name Name of album cover to extract color palette from. Thus far, the following albums are available:
#'   \code{gish}, \code{gish_dark},  \code{gish_light},
#'   \code{simamese_dream}, \code{simamese_dream_dark},  \code{simamese_dream_light}, \code{simamese_dream_re},
#'   \code{mellon_collie},  \code{mellon_collie_dark} , \code{mellon_collie_light} ,
#'   \code{adore}, \code{zeitgeist}, \code{oceania}, \code{cyr}
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colors.
#'   @importFrom graphics rgb rect par image text
#' @return A vector of colors.
#' @export
#' @keywords colors
#' @examples
#'
#' pumpkins_palette("gish")
#' pumpkins_palette("mellon_collie")
#' pumpkins_palette("oceania")
#' pumpkins_palette("simamese_dream_re", 4)
#'
#' # If more colors than are saved in a palette are needed, please specify a
#' # continuous palette to interpolate between saved colors.
#'
#' pal <- pumpkins_palette(21, name = "oceania", type = "continuous")
#' image(volcano, col = pal)
#'

pumpkins_palette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)

  pal <- pumpkins_palettes[[name]]
  if (type == "continuous" && name == "mellon_collie") {
    pal <- pumpkins_palettes[["mellon_collie"]]
  }

  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what palette can offer")
  }

  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal)(n),
                discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}

#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb

print_palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "sans")
}

