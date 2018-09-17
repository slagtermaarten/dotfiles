# options(repos = structure(c(CRAN='http://cran-mirror.cs.uu.nl/')))
.First <- function() {
  options(repos = c(CRAN = "https://cran.rstudio.com/"),
          browserNLdisabled = TRUE,
          pkgType = 'both',
          deparse.max.lines = 2)
  if (Sys.getenv('HOSTNAME') == 'coley') {
    options(pkgType = 'source')
  }
  options(max.print=200)
  options(digits = 3)
  options(menu.graphics = FALSE)
  desired_packages <- c('datasets', 'utils', 'grDevices', 'graphics', 'stats',
                        'methods', 'pacman', 'devtools', 'ggplot2',
                        'data.table', 'dplyr')
  options(defaultPackages = intersect(rownames(utils::installed.packages()),
                                      desired_packages))
  options(tz = 'Europe/Berlin')
  Sys.setenv(TZ = 'Europe/Amsterdam')
}

if (interactive()) {
  # if (!require('devtools')) {
  #   install.packages('devtools')
  # }
  # if (!require('pacman')) {
  #   install.packages('pacman')
  # }
  # suppressMessages(require(devtools))
}

wideScreen <- function(howWide=Sys.getenv('COLUMNS')) {
  options(width=as.integer(howWide))
}

if ('colorout' %in% utils::installed.packages()[, 1]) {
  colorout::setOutputColors256(normal=4, string=3, verbose = F)
} else {
  tryCatch(devtools::install_github('jalvesaq/colorout'), 
           error = function(e) { 
             print(e); 
             print('Pkg colorout not installed and not obtained from Github') 
           }) 
}

# install.packages( 
#   lib  = lib <- .libPaths()[1],
#   pkgs = as.data.frame(installed.packages(lib), stringsAsFactors=FALSE)$Package,
#   type = 'source'
# )
# vim: set ft=r:
