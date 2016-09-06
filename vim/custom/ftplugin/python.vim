setlocal number
nnoremap <buffer> <localleader>r :w <cr> :! python % <cr>
" set cursorline
nnoremap <silent> <leader>i oimport pudb; pudb.set_trace()<esc>

au Bufenter,BufNewFile,BufReadPost *.py let g:pymode = 0
au Bufenter,BufNewFile,BufReadPost *.py map <Leader>de oimport pudb; pudb.set_trace()  # BREAKPOINT<C-c>
