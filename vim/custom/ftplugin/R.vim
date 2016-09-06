setlocal shiftwidth=2
setlocal tabstop=2
nnoremap <buffer> <S-k> :call g:SendCmdToR('?' . expand("<cword>")) <CR>
nnoremap <buffer> gc :call g:SendCmdToR('\x03') <CR>
nnoremap <buffer> <leader>fb :/\vbrowser\(\)/ <CR>
iabbrev  < <-
