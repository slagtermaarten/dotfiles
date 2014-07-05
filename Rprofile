options(repos=structure(c(CRAN="http://cran-mirror.cs.uu.nl/")))

load.lib <- function(x) { 
    x <- as.character(substitute(x)) 
    if(isTRUE(x %in% .packages(all.available=TRUE))) { 
        eval(parse(text=paste("require(", x, ")", sep=""))) 
    } else { 
        update.packages()
        eval(parse(text=paste("install.packages('", x, "')", sep=""))) 
    } 
} 

load.lib(knitr)
load.lib(ggplot2)
load.lib(reshape2)
