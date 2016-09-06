# library(utils)
options(repos=structure(c(CRAN="http://cran-mirror.cs.uu.nl/")))

wideScreen <- function(howWide=Sys.getenv("COLUMNS")) {
  options(width=as.integer(howWide))
}

# if (!require("devtools")) devtools::install_github("Rdatatable/data.table")
if (!require("vimcom")) devtools::install_github("jalvesaq/VimCom")
if (!require("colorout")) devtools::install_github("jalvesaq/colorout")
if (!require("pacman")) install.packages("pacman")

rootFolder <- path.expand(file.path('~/antigenic_space'))
# vim: set ft=r:

