options(repos=structure(c(CRAN='http://cran-mirror.cs.uu.nl/')))
options(max.print=200)
options(defaultPackages = c('datasets', 'utils', 'grDevices', 'graphics',
                            'stats', 'methods', 'nvimcom'))

wideScreen <- function(howWide=Sys.getenv('COLUMNS')) {
  options(width=as.integer(howWide))
}

if ('colorout' %in% utils::installed.packages()[, 1]) {
  colorout::setOutputColors256(normal=4, string=3, verbose = F)
}

# vim: set ft=r:
