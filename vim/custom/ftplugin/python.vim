setlocal number
nnoremap <buffer> <localleader>r :w <cr> :! python % <cr>
" set cursorline
nnoremap <silent> <leader>i oimport pudb; pudb.set_trace()<esc>
