setlocal shiftwidth=2
setlocal tabstop=2
iabbrev  < <-

nnoremap <buffer> <S-k> :call g:SendCmdToR('?' . expand("<cword>")) <CR>
nnoremap <buffer> <leader>rh :call g:SendCmdToR('head(' . expand("<cword>") . ')') <CR>
nnoremap <buffer> <leader>ht :call g:SendCmdToR('tail(' . expand("<cword>") . ')') <CR>
nnoremap <buffer> <leader>lf :call g:SendCmdToR('list.files(' . expand("<cword>") . ')') <CR>
nnoremap <buffer> <leader>tb :call g:SendCmdToR('traceback()') <CR>
nnoremap <buffer> <leader>rr :call g:SendCmdToR('devtools::load_all(file.path(rootFolder, "libs", "fasanalysis"))') <CR>
nnoremap <buffer> <leader>fb :/\vbrowser\(\)/ <CR>

" Debug mode commands
nnoremap <buffer> <leader>dq :call g:SendCmdToR('Q') <CR>
nnoremap <buffer> <leader>dc :call g:SendCmdToR('c') <CR>
nnoremap <buffer> <leader>dn :call g:SendCmdToR('n') <CR>
" nnoremap <buffer> <leader>dc :call g:SendCmdToR('^C') <CR>
" nnoremap <buffer> <leader>dc :call g:SendCmdToR('<c>c') <CR>
" nnoremap <buffer> <leader>dc :call g:SendCmdToR('\\cc') <CR>
" nnoremap <buffer> <leader>dc :call g:SendCmdToR('\x03') <CR>
nnoremap <buffer> <leader>d0 :call g:SendCmdToR('0') <CR>
nnoremap <buffer> <leader>ls :call g:SendCmdToR('ls()') <CR>
nnoremap <buffer> <leader>dw :call g:SendCmdToR('where') <CR>


if exists(':SlimuxGlobalConfigure')
  " Place commands currently worked on in devel.R, move those to tests when
  " finished
  nnoremap <Leader>ed :split ~/antigenic_space/maarten-analyses/devel.Rmd<CR>
  nnoremap <Leader>oc :SlimuxSendKeys 'C-C'<CR>
  " nnoremap <Leader>mh :execute "SlimuxSendKeys '?expand("<cword>")'"<CR>

  fu! GetRHelp()
    let l:helpquery = expand("<cword>")
    echo l:helpquery
    execute "SlimuxSendKeys '?" . l:helpquery . "'" <CR> <bar> 
     \ :SlimuxSendKeys 'Enter'<CR>
  endfu
  command! CallRHelp :call GetRHelp()

  " Debugging commands
  nnoremap <Leader>tb :SlimuxSendKeys 'traceback()' <CR> <bar>
    \ :SlimuxSendKeys 'Enter'<CR>
  nnoremap <Leader>qq :SlimuxSendKeys 'q' <CR> <bar>
    \ :SlimuxSendKeys 'Enter'<CR>
  nnoremap <Leader>dq :SlimuxSendKeys 'Q' <CR> <bar>
    \ :SlimuxSendKeys 'Enter'<CR>
  nnoremap <Leader>dn :SlimuxSendKeys 'n' <CR> <bar>
    \ :SlimuxSendKeys 'Enter'<CR>
  nnoremap <Leader>dc :SlimuxSendKeys 'c' <CR> <bar>
    \ :SlimuxSendKeys 'Enter'<CR>
  nnoremap <Leader>dw :SlimuxSendKeys 'where' <CR> <bar>
    \ :SlimuxSendKeys 'Enter'<CR>
  nnoremap <Leader>ls :SlimuxSendKeys 'ls()' <CR> <bar>
    \ :SlimuxSendKeys 'Enter'<CR>
  nnoremap <Leader>wa :SlimuxSendKeys 'warnings()' <CR> <bar>
    \ :SlimuxSendKeys 'Enter'<CR>
  " nnoremap <Leader>tt :SlimuxSendKeys 'devtools::test(\\')' <CR> <bar>
  "   \ :SlimuxSendKeys 'Enter'<CR>
endif
