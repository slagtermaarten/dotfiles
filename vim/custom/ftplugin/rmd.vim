setlocal linebreak
setlocal textwidth=90
setlocal commentstring=#%s

nnoremap <buffer> <S-k> :call g:SendCmdToR('?' . expand("<cword>")) <CR>
nnoremap <buffer> <S-,> <buffer> :call g:SendCmdToR('q') <CR>
nnoremap <silent> <buffer> <LocalLeader>rr :call g:SendCmdToR('rmarkdown::render("'
 \ . expand("%:t") . '", intermediates_dir = "knitr_intermed",
 \ output_dir = "knitr_output")') <CR>

iabbrev < <-
