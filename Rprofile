# library(utils)
options(repos=structure(c(CRAN="http://cran-mirror.cs.uu.nl/")))

load.fun <- function(x) {
    x <- as.character(substitute(x))
    if (isTRUE(x %in% .packages(all.available=TRUE))) {
        eval(parse(text=paste("require(", x, ")", sep="")))
    } else {
        update.packages()
        eval(parse(text=paste("install.packages('", x, "')", sep="")))
    }
}

if(interactive()){
    library(colorout)
    library(setwidth)
    library(vimcom)
}

library(knitr)
library(reshape2)

# setHook('plot.new', function(...) par(mar=c(3,3,2,1), mgp=c(2,.7,0), tck=-.01))
