" Open R session
exe "normal ,rf"
exe "normal ,rd"
call g:SendCmdToR("source('./.Rprofile')")
" call g:SendCmdToR("knit('" . expand('%:t') .  "')")

" Knit file, loading all variables into workspace
exe "normal ,kn"
