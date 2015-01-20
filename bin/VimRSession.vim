" Open R session
exe "normal ,rf"
call g:SendCmdToR("knit('" . expand('%:t') .  "')")

" Knit file, loading all variables into workspace
exe "normal ,kp"
