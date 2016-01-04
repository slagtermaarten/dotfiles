setlocal linebreak
setlocal textwidth=90

nnoremap <buffer> <S-k> :call g:SendCmdToR('?' . expand("<cword>")) <CR>
nnoremap <S-,> <buffer> :call g:SendCmdToR('q') <CR>
nnoremap <silent> <buffer> <LocalLeader>rr :call g:SendCmdToR('rmarkdown::render("' . expand("%:t") . '")') <CR>
