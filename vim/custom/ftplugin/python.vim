setlocal number
nnoremap <buffer> <localleader>r :w <cr> :! python % <cr>
" set cursorline
nnoremap <silent> <leader>i oimport pudb; pudb.set_trace()<esc>
set sw=4
set ts=4

au Bufenter,BufNewFile,BufReadPost *.py let g:pymode = 0
au Bufenter,BufNewFile,BufReadPost *.py map <Leader>de oimport pudb; pudb.set_trace()  # BREAKPOINT<C-c>

function! SyncRemote()
  "" Asynchronously sync files
  Dispatch rsync -avz % m.slagter@paranoid:~/NeoScreens/
  sleep 4
  call SlimuxSendCode('snakemake -j 16' . "\n") 
endfunction

nnoremap <buffer> <leader>sr :call SyncRemote() <CR>
