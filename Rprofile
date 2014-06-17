options(repos=structure(c(CRAN="http://cran-mirror.cs.uu.nl/")))

load.fun <- function(x) { 
    x <- as.character(substitute(x)) 
    if(isTRUE(x %in% .packages(all.available=TRUE))) { 
        eval(parse(text=paste("require(", x, ")", sep=""))) 
    } else { 
        update.packages()
        eval(parse(text=paste("install.packages('", x, "')", sep=""))) 
    } 
} 

load.fun(knitr)
load.fun(ggplot2)
load.fun(reshape2)
