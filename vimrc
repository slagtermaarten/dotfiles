set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/custom
call vundle#rc()
filetype plugin indent on

" Bundles {{{
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nelstrom/vim-markdown-folding'
Bundle 'L9'
Bundle 'tComment'
Bundle 'c.vim'
Bundle 'Vim-R-plugin'
Bundle 'wincent/Command-T'
Bundle 'rsmenon/vim-mathematica'
Bundle 'bling/vim-airline'
Bundle 'sukima/xmledit'
Bundle 'tsaleh/vim-matchit'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'ervandew/supertab'
Bundle 'slagtermaarten/ultisnips'
Bundle 'slagtermaarten/LaTeX-Box'
Bundle 'Rip-Rip/clang_complete'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/taglist.vim'
Bundle 'fs111/pydoc.vim'
Bundle 'scrooloose/syntastic'

" Bundle 'matze/vim-tex-fold'
" Bundle 'klen/python-mode'
" Bundle 'ivanov/vim-ipython'
" Bundle 'johndgiese/vipy'
" }}}

" Settings {{{
set pastetoggle=<F2>
" set listchars
set clipboard=unnamed
set showmode
set bs=2
set hidden
set laststatus=2
set tabstop=4
set expandtab
set autoindent
set hlsearch
set softtabstop=4
set shiftwidth=4
set incsearch
set nobackup
set noswapfile
set noerrorbells
set wildignore=*.swp,*.bak,*.pyc,*.class
set undolevels=700
set history=700
set wildmenu
set wildignore=*.o,*.bbl,*.pdf,*.out,*.blg,*.aux,*.log,*.latexmk
set so=10
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set lazyredraw
set matchtime=3
" set showbreak=↪
set splitbelow
set splitright
set colorcolumn=
set grepprg=ack-grep\ -k
" set t_Co=256
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
" set statusline=%<%f\ %=%-14.(%l,%c%V%)\ %P
syntax sync minlines=10
syntax enable
let NERDTreeChDirMode=1
let g:nerdtree_tabs_open_on_gui_startup=0
let vimrplugin_screenplugin = 0
let g:mma_highlight_option = "solarized"
let g:mma_candy = 1
set encoding=utf-8
let g:airline_powerline_fonts=1
let g:airline#extensions#bufferline#enabled=1
let g:airline#extensions#bufferline#overwrite_variables=1
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline_section_b='%{strftime("%H:%M")}'
let g:airline_section_y='BN %{bufnr("%")}'
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsUsePythonVersion=2
let g:clang_library_path= '/usr/lib/llvm-3.2/lib'
set foldmethod=marker
set tags=./tags;$HOME
set tags+=$HOME/CompuCell3D/CompuCell3D/core
" }}}

" Functions {{{
let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 16

function! AdjustFontSize(amount)
  if has("gui_gtk2") && has("gui_running")
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

" function! OpenCC3DSim()
"   SyntasticToggleMode
"   e dir/Simulation/*.py
"   echomsg "Ran my command"
" endfunction

fun! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction

func! WordProcessorMode()
    " setlocal formatoptions=1
    " setlocal noexpandtab
    " set formatoptions+="tpcqa"
    setlocal spell spelllang=en_us
    set thesaurus+=~/mthesaur.txt
    " set complete+=s
endfu
com! WP call WordProcessorMode()

fun! ResetSyntax()
    " TeX syntax tends to freeze, confusing everything to be in mathmode
    echom "Syntax reset!"
    syntax off
    syntax on
endfun
" }}}

" Mappings {{{
let mapleader = ","
" let maplocalleader = "\\"
let maplocalleader = ","
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFind<CR>
cnoreabbrev wq w<bar>bd
cnoreabbrev bq bp<bar>sp<bar>bn<bar>bd
" cnoreabbrev q bd
vnoremap <F4> y:execute "%s/".escape(@",'[]/')."//gc"<Left><Left><Left><Left>
nnoremap ; :
nnoremap j gj
nnoremap k gk
nnoremap <silent> <leader>w :wa <cr>:! make all<cr>
nnoremap <silent> <leader>sy :SyntasticToggleMode<cr>
let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': [],'passive_filetypes': []}
nnoremap <leader>m :wa <cr> :make <cr>
nnoremap <leader>c <c-_><c-_>
nnoremap <leader>y :call ResetSyntax() <cr>
" nnoremap <F5> :e!<cr>
" nnoremap <leader>cs <c-_><c-_> gUU
nnoremap ;ww :w<CR>
nnoremap <C-h> :bprev<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>mb :%s/\.\(\s\+\|$\)/.\r/g
nnoremap q; q:
nnoremap ;q :q
nnoremap ;n :n
nnoremap ! :!
nnoremap H ^
nnoremap L $
vnoremap L $
nnoremap <silent> <leader>es :tabedit ~/dotfiles/aliases.sh<CR>
nnoremap <silent> <leader>ec :tabedit ~/convenienceCC3D<CR>
nnoremap <silent> <leader>ed :tabedit ~/dotfiles<CR>
nnoremap <silent> <leader>eb :tabedit ~/dotfiles/bin<CR>
nnoremap <silent> <leader>em :tabedit Makefile<CR>
nnoremap <silent> <leader>ev :tabedit $MYVIMRC<CR>
nnoremap <silent> <leader>eg :tabedit ~/.gitconfig<CR>
nnoremap <silent> <leader>ea :tabedit ~/.config/awesome/rc.lua <CR>
nnoremap <silent> <leader>et :tabedit ~/dotfiles/tmux.conf <CR>
nnoremap <silent> <leader>ef :tabedit ~/.vim/custom/ftplugin <CR>
nnoremap <silent> <leader>bi :BundleInstall<CR>
nnoremap <silent> <leader>o :CommandTJump<CR>
nnoremap <silent> <leader>sc :tabp<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC <CR> :syntax on <CR>
nnoremap <C-DOWN> :call SmallerFont() <cr>
nnoremap <C-UP> :call LargerFont() <cr>
nnoremap <silent><leader>t :TlistToggle <cr>
" nnoremap <leader>pa :! pandoc % | :! xclip

" nnoremap <silent> <leader>tn :tabn<CR>
" nnoremap <silent> <leader>tp :tabp<CR>
nnoremap <silent> <leader>a za
vnoremap < <gv
vnoremap > >gv
nnoremap Q gqap
vnoremap Q gq
inoremap <c-d> <esc>ld$a
nnoremap <c-d> dd
inoremap <c-q> <esc>gqipe
inoremap <c-u> <esc>bviwUea
nnoremap <c-u> viwUe
nnoremap <leader>c :!clear <cr><cr>
nnoremap <leader>j Jxxi,<esc>
" map <tab> %
vnoremap <Leader>s :sort<CR>
" Easy copy paste commands
noremap <C-a> ggVG
vnoremap <C-c> "+y
noremap <C-p> i<C-r>+ <Esc>
inoremap <C-p> <C-r>+
" }}}

" Gui, mouse, appearance {{{
if has('gui_running')
    colorscheme solarized
    nnoremap <C-h> :tabprev<CR>
    nnoremap <C-l> :tabnext<CR>
    let g:airline_theme='solarized'
    let g:solarized_contrast="high"
    set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline\ 10
    " set lines=40 columns=80
    set guioptions-=T
    set guioptions-=m
    set fileencoding=utf-8
    set enc=utf-8
endif

if has('mouse')
    set mouse=a
endif
" }}}

" Autocommands{{{
augroup randomautocmds
    autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent loadview
    " autocmd BufWinEnter *.* :NERDTreeCWD
    autocmd! bufwritepost .vimrc source %
    autocmd BufEnter * silent! lcd %:p:h
    au Bufenter,BufNewFile,BufReadPost *.md set filetype=markdown
    au FocusLost * :silent! wall
    " Resize splits when the window is resized
    au VimResized * :wincmd =
    " autocmd vimenter * if !argc() | NERDTree | endif
augroup END

augroup pymode
    au Bufenter,BufNewFile,BufReadPost *.py let g:pymode = 0
    au Bufenter,BufNewFile,BufReadPost *.py map <Leader>de oimport pudb; pudb.set_trace()  # BREAKPOINT<C-c>
augroup end

augroup filetypechecking
    au BufRead *.m set ft=mma "Mathematica
    au BufRead *.tex set ft=tex
    au BufRead *.Rmd set ft=r
    au BufRead *.Rmd setlocal syntax=off
    au BufRead *.tex let g:LatexBox_Folding=0
    au BufRead *.tex set foldmethod=marker
    au Bufenter,BufNewFile,BufReadPost,BufRead *.cc3d set ft=xml
augroup end
" }}}

" Abbreviations {{{
iabbrev THe The
iabbrev cc3 CompuCell3D
" }}}

" SyntasticToggleMode
