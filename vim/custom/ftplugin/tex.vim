au Bufenter,BufNewFile,BufReadPost,BufRead *.tex set ft=tex
au Bufenter,BufNewFile,BufReadPost,BufRead *.tex let g:LatexBox_Folding=0
au Bufenter,BufNewFile,BufReadPost,BufRead *.tex set foldmethod=marker

setlocal errorformat=%f:%l:\ %m,%f:%l-%\\d%\\+:\ %m
if filereadable('Makefile')
    setlocal makeprg=make
" else
"     exec "setlocal makeprg=make\\ -f\\ ~/bin/latex.mk\\ " . substitute(bufname("%"),"tex","pdf", "")
endif

" let g:Latexbox_Folding = 'yes'

set syntax=tex
" setlocal foldmethod=syntax
UltiSnipsAddFiletypes tex
set thesaurus+=~/mthesaur.txt

let g:surround_{char2nr('_')} = "_{\r}"
let g:surround_{char2nr('t')} = "\\text{\r}"
let g:surround_{char2nr('i')} = "\\emph{\r}"
let g:surround_{char2nr('b')} = "\\textbf{\r}"
let g:surround_{char2nr('v')} = "\\verbatim{\r}"
let g:surround_{char2nr('o')} = "\\overline{\r}"
let g:surround_{char2nr('s')} = "\\sub{\r}"
let g:surround_{char2nr('m')} = "% {{{\n\r\n % }}}"

function! ViewPdf()
    execute "! evince " . substitute(bufname("%"),"tex","pdf", "") . "&"
endfunction
noremap <buffer> <leader> e :call ViewPdf() <cr>

set colorcolumn=
set linebreak
call WordProcessorMode()
