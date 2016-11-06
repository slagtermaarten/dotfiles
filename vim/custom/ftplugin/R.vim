setlocal shiftwidth=2
setlocal tabstop=2
" nnoremap <buffer> gc :call g:SendCmdToR('\x03') <CR>
nnoremap <buffer> <S-k> :call g:SendCmdToR('?' . expand("<cword>")) <CR>
nnoremap <buffer> <leader>rh :call g:SendCmdToR('head(' . expand("<cword>") . ')') <CR>
nnoremap <buffer> <leader>ht :call g:SendCmdToR('tail(' . expand("<cword>") . ')') <CR>
nnoremap <buffer> <leader>lf :call g:SendCmdToR('list.files(' . expand("<cword>") . ')') <CR>
nnoremap <buffer> <leader>tb :call g:SendCmdToR('traceback()') <CR>
nnoremap <buffer> <leader>dq :call g:SendCmdToR('Q') <CR>
nnoremap <buffer> <leader>sc :call g:SendCmdToR('\x03') <CR>
nnoremap <buffer> <leader>rr :call g:SendCmdToR('devtools::load_all(file.path(rootFolder, "libs", "fasanalysis"))') <CR>
nnoremap <buffer> <leader>ls :call g:SendCmdToR('ls()') <CR>
nnoremap <buffer> <leader>dw :call g:SendCmdToR('where') <CR>
nnoremap <buffer> <leader>fb :/\vbrowser\(\)/ <CR>
iabbrev  < <-
