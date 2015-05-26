setlocal linebreak
setlocal textwidth=90
set commentstring=#\ %s

map <silent> <LocalLeader>r :call g:SendCmdToR('library(rmarkdown); rmarkdown::render("' . expand("%:t") . '")') <CR>
