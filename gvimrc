" No audible bell
set vb

" No toolbar
set guioptions-=T

" set guioptions-=m

" Use console dialogs
set guioptions+=c

" Local config
if filereadable($HOME . "/.gvimrc.local")
  source ~/.gvimrc.local
endif

colorscheme solarized
" noremap <leader>j :call TabMove(-1)<CR>
" noremap <leader>k :call TabMove(1)<CR>
set guitablabel=%t
let g:airline_theme='solarized'
let g:solarized_contrast="high"
set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline\ 10
set guifont=Monaco\ for\ Powerline:h12
" set lines=50 columns=90
set fileencoding=utf-8
set enc=utf-8

let g:nerdtree_tabs_open_on_gui_startup=0

" {{{ Font size manipulation
let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 16

function! AdjustFontSize(amount)
  if has("gui_gtk2")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = cursize + a:amount
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
      let newfont = fontname . newsize
      let &guifont = newfont
    endif
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
endfunction

function! LargerFont()
  call AdjustFontSize(1)
  " echom 'exec('set guifont?')'
  set guifont?
endfunction
command! LargerFont call LargerFont()

function! SmallerFont()
  call AdjustFontSize(-1)
  set guifont?
endfunction
command! SmallerFont call SmallerFont()
" }}}

