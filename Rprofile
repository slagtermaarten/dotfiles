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
  options(defaultPackages = c('datasets', 'utils', 'grDevices', 'graphics',
                              'stats', 'methods', 'nvimcom'))
}

if (interactive()) {
  suppressMessages(require(devtools))
}

wideScreen <- function(howWide=Sys.getenv('COLUMNS')) {
  options(width=as.integer(howWide))
}

if ('colorout' %in% utils::installed.packages()[, 1]) {
  colorout::setOutputColors256(normal=4, string=3, verbose = F)
} else {
  tryCatch(devtools::install_github('jalvesaq/colorout'), 
           error = function(e) { print(e); 
           print('could not install colorout pkg') }) 
}
# vim: set ft=r:
