#!/usr/bin/env r

if (!require('devtools')) { 
  tryCatch(install.packages('devtools'), 
    error = function(e) { print(e) })  
}
if (!require('data.table')) { 
  tryCatch(devtools::install_github('Rdatatable/data.table'), 
    error = function(e) { print(e) })  
}
# if (!require('vimcom')) { 
#   tryCatch(devtools::install_github('jalvesaq/VimCom'), 
#     error = function(e) { print(e) })  
# }
if (!require('pacman')) { 
  tryCatch(install.packages('pacman'), 
    error = function(e) { print(e) })  
}
if (!require('colorout')) { 
  tryCatch(devtools::install_github('jalvesaq/colorout'), 
    error = function(e) { print(e) })  
}
if (!require('maartenutils')) { 
  tryCatch(devtools::install('~/libs/maartenutils'), 
    error = function(e) { 
      tryCatch(devtools::install_github('slagtermaarten/maartenutils'), 
        error = function(e) { 
          print(e) 
        })  
    })  
}
if (!require('docopt')) { 
  tryCatch(devtools::install_github('docopt/docopt.R'), 
    error = function(e) { print(e) })  
}
if (!require('tidyverse')) { 
  tryCatch(install.packages('tidyverse'), 
    error = function(e) { print(e) })  
}
