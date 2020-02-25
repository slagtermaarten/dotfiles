setlocal shiftwidth=2
setlocal tabstop=2
" iabb <buffer> _ <-
nnoremap <buffer> <silent> <leader>dt :! rm %:p.tmp.R<CR>
" set autowrite
set noautowrite
set cindent
set nosmartindent
setlocal wrap
" set smartindent
setlocal comments=b:##,b:#',b:#
" setlocal commentstring=#%s
setlocal textwidth=80
set formatoptions=tcrqj

" nnoremap <buffer> <S-k> :call g:SendCmdToR('?' . expand("<cword>")) <CR>
" nnoremap <buffer> <leader>rh :call g:SendCmdToR('head(' . expand("<cword>") . ')') <CR>
" nnoremap <buffer> <leader>ht :call g:SendCmdToR('tail(' . expand("<cword>") . ')') <CR>
" nnoremap <buffer> <leader>lf :call g:SendCmdToR('list.files(' . expand("<cword>") . ')') <CR>
" nnoremap <buffer> <leader>tb :call g:SendCmdToR('traceback()') <CR>
" nnoremap <buffer> <leader>rr :call g:SendCmdToR('devtools::load_all(file.path("~/antigenic_space", "libs", "fasanalysis"))') <CR>
nnoremap <buffer> <leader>fb :/\v^\s*browser\(\)/ <CR>
nnoremap <buffer> <leader>ft :/\v^\s*if\s*\(T\)/ <CR>
nnoremap <buffer> <leader>ff :/\v^\s*if\s*\(F\)/ <CR>
nnoremap <buffer> <leader>sf osource("<Esc>"fpa")<Esc>

" From https://stackoverflow.com/questions/13597256/change-r-indentation-style-in-vim-with-vim-r-plugin#24259977
let r_indent_align_args = 1
" Set vim-r-plugin to mimics ess :
let r_indent_ess_comments = 0
let r_indent_ess_compatible = 0

function! ProjectSearch()
  let l:searchterm = expand("<cword>")
	echom "Searching for: " . l:searchterm
  execute "Ack! " . l:searchterm . " ~/libs/maartenutils/R" 
  " execute "AckAdd " . l:searchterm . " ~/antigenic_space/libs/fasanalysis/R"
  " execute "AckAdd " . l:searchterm . " ~/antigenic_space/libs/firehosedownload/R"
endfunction
nnoremap <buffer> <leader>aps :call ProjectSearch() <CR>
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
  nnoremap <buffer> <silent> <leader>rn :call SlimuxSendCode('names(' . expand("<cword>") . ')' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>rta :call SlimuxSendCode('tail(' . expand("<cword>") . ')' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>rdh :call SlimuxSendCode(expand("<cword>") . '[1:5, 1:5]' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>rdt :call SlimuxSendCode(expand("<cword>") . '[(.N-5):.N, 1:5]' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>rp :call SlimuxSendCode('print(' . expand("<cword>") . ')' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>tt :call SlimuxSendCode('table(' . expand("<cword>") . ')' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>rg :call SlimuxSendCode('plot(' . expand("<cword>") . ')' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>ds :call SlimuxSendCode('round(dev.size(units = "cm"))' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>on :call SlimuxSendCode('names(' . expand("<cword>") . ')' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>ol :call SlimuxSendCode('length(' . expand("<cword>") . ')' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>ot :call SlimuxSendCode('str(' . expand("<cword>") . ')' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>ocl :call SlimuxSendCode('class(' . expand("<cword>") . ')' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>od :call SlimuxSendCode('dim(' . expand("<cword>") . ')' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>on :call SlimuxSendCode('dimnames(' . expand("<cword>") . ')' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>db :call SlimuxSendCode('debug(' . expand("<cword>") . ')' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>dbo :call SlimuxSendCode('debugonce(' . expand("<cword>") . ')' . "\n") <CR>
  nnoremap <buffer> <silent> <S-k> :call SlimuxSendCode('?' . expand("<cword>") . "\n") <CR>
  nnoremap <buffer> <silent> <leader>aa :call SlimuxSendCode('source("' . expand("%:p") . '")' . "\n") <CR><CR>
  nnoremap <buffer> <silent> <leader>tb :call SlimuxSendCode('traceback()' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>qq :call SlimuxSendCode('q' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>gw :call SlimuxSendCode('getwd()' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>sw :call SlimuxSendCode('setwd("' . expand("%:p:h") . '")' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>dq :call SlimuxSendCode('Q' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>dn :call SlimuxSendCode('n' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>dc :call SlimuxSendCode('c' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>dw :call SlimuxSendCode('where' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>ls :call SlimuxSendCode('ls()' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>wa :call SlimuxSendCode('warnings()' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>tf :call SlimuxSendCode('test_fun()' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>tp :call SlimuxSendCode('plot(1:3)' . "\n") <CR>
  nnoremap <buffer> <silent> <leader>do :call SlimuxSendCode('dev.off()' . "\n") <CR>
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
