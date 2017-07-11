setlocal shiftwidth=2
setlocal tabstop=2
" iabb <buffer> _ <-
nnoremap <buffer> <silent> <leader>dt :! rm %.tmp.R<CR>
set autowrite
setlocal commentstring=#%s
setlocal comments="#, #\\', ##'

" nnoremap <buffer> <S-k> :call g:SendCmdToR('?' . expand("<cword>")) <CR>
" nnoremap <buffer> <leader>rh :call g:SendCmdToR('head(' . expand("<cword>") . ')') <CR>
" nnoremap <buffer> <leader>ht :call g:SendCmdToR('tail(' . expand("<cword>") . ')') <CR>
" nnoremap <buffer> <leader>lf :call g:SendCmdToR('list.files(' . expand("<cword>") . ')') <CR>
" nnoremap <buffer> <leader>tb :call g:SendCmdToR('traceback()') <CR>
" nnoremap <buffer> <leader>rr :call g:SendCmdToR('devtools::load_all(file.path("~/antigenic_space", "libs", "fasanalysis"))') <CR>
" nnoremap <buffer> <leader>fb :/\v^\s*browser\(\)/ <CR>
" nnoremap <buffer> <leader>fpb :/\v^\s*perm_browser\(\)/ <CR>
" nnoremap <buffer> <leader>ft :/if (T)/ <CR>

" Debug mode commands
" nnoremap <buffer> <leader>dq :call g:SendCmdToR('Q') <CR>
" nnoremap <buffer> <leader>dc :call g:SendCmdToR('c') <CR>
" nnoremap <buffer> <leader>dn :call g:SendCmdToR('n') <CR>
" nnoremap <buffer> <leader>dc :call g:SendCmdToR('^C') <CR>
" nnoremap <buffer> <leader>dc :call g:SendCmdToR('<c>c') <CR>
" nnoremap <buffer> <leader>dc :call g:SendCmdToR('\\cc') <CR>
" nnoremap <buffer> <leader>dc :call g:SendCmdToR('\x03') <CR>
" nnoremap <buffer> <leader>d0 :call g:SendCmdToR('0') <CR>
" nnoremap <buffer> <leader>ls :call g:SendCmdToR('ls()') <CR>
" nnoremap <buffer> <leader>dw :call g:SendCmdToR('where') <CR>
" autocmd! BufWritePre <buffer> :call StripTrailingWhitespaces()

" command! SendRCommand call SlimuxSendCode("<args>" . "\n")

function! GetRHelp()
  let l:helpquery = expand("<cword>")
  echo l:helpquery
  call SlimuxSendCode("?'" . 'l:helpquery' . "'\n") <CR>
endfunction

if exists(':SlimuxGlobalConfigure')
  command! CallRHelp :call GetRHelp()
  nnoremap <buffer> <silent> <leader>rh :call SlimuxSendCode('head(' . expand("<cword>") . ')' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>rta :call SlimuxSendCode('tail(' . expand("<cword>") . ')' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>rdh :call SlimuxSendCode(expand("<cword>") . '[1:5, 1:5]' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>rdt :call SlimuxSendCode(expand("<cword>") . '[(.N-5):.N, 1:5]' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>rp :call SlimuxSendCode('print(' . expand("<cword>") . ')' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>tt :call SlimuxSendCode('table(' . expand("<cword>") . ')' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>rg :call SlimuxSendCode('plot(' . expand("<cword>") . ')' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>ds :call SlimuxSendCode('round(dev.size(units = "cm"))' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>rn :call SlimuxSendCode('names(' . expand("<cword>") . ')' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>rl :call SlimuxSendCode('length(' . expand("<cword>") . ')' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>rt :call SlimuxSendCode('str(' . expand("<cword>") . ')' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>od :call SlimuxSendCode('dim(' . expand("<cword>") . ')' . "\n") <CR>
  nnoremap <buffer> <silent> <S-k> :call SlimuxSendCode('?' . expand("<cword>") . "\n") <CR>
  nnoremap <buffer> <silent> <leader>tb :call SlimuxSendCode('traceback()' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>qq :call SlimuxSendCode('q' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>gw :call SlimuxSendCode('getwd()' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>dq :call SlimuxSendCode('Q' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>dn :call SlimuxSendCode('n' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>dc :call SlimuxSendCode('c' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>dw :call SlimuxSendCode('where' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>ls :call SlimuxSendCode('ls()' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>wa :call SlimuxSendCode('warnings()' . "\n") <CR>
endif


function! SyncRemote()
    "" Asynchronously sync files
    Dispatch putils sac <bar> cclose
    " :call SlimuxSendCode('devtools::load_all(file.path(\"~/antigenic_space\", \"libs\", "\fasanalysis\"))' . '\n')
    " sleep 4 "seconds
    " :call SlimuxSendCode('devtools::load_all(file.path("~/antigenic_space", "libs", "fasanalysis"))' . "\n")
    call SlimuxSendCode('resync_reload()' . "\n") 
		cclose
endfunction

nnoremap <buffer> <leader>sr :call SyncRemote() <CR>
