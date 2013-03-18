set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

filetype plugin indent on

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
" Bundle "SirVer/ultisnips"
Bundle "slagtermaarten/ultisnips"
Bundle "Raimondi/delimitMate"
Bundle "altercation/vim-colors-solarized"
Bundle "nelstrom/vim-markdown-folding"
Bundle 'L9'
Bundle 'tComment'
Bundle 'c.vim'
Bundle 'Vim-R-plugin'

" Bundle "snipmate-snippets"
" Bundle "garbas/vim-snipmate"
" Bundle 'LaTeX-Suite-aka-Vim-LaTeX'

au BufNewFile,BufReadPost *.tex set syntax=tex 
au BufNewFile,BufReadPost *.tex :UltiSnipsAddFiletypes tex
au BufNewFile,BufReadPost *.tex :so ~/.vim/myTeXsurrounds.vim
au Bufenter,BufNewFile,BufReadPost *.hs compiler ghc
au Bufenter,BufNewFile,BufReadPost *.md set syntax=markdown
" au BufRead,BufNewFile,BufReadPost *.txt,*.tex set
" thesaurus+=~/.vim/thesaurus/mthesaur.txt 

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsUsePythonVersion=2
syntax enable
set backspace=indent,eol,start
set pastetoggle=<F2>
set showmode
set hidden
set laststatus=2
set tabstop=4
set expandtab
set autoindent
set smartindent
set nocursorcolumn
set nocursorline
set softtabstop=4
set shiftwidth=4
set incsearch
set nobackup
set noswapfile
set noerrorbells
set wildignore=*.swp,*.bak,*.pyc,*.class
set undolevels=100
set history=100
set wildmenu
set wildignore=*.o,a.out,*.bbl,*.pdf
set autochdir
set so=10
set textwidth=80
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set statusline=%<%f\ %=%-14.(%l,%c%V%)\ %P
set foldmethod=manual
set formatoptions+="tpcqa"
syntax sync minlines=10
set clipboard=unnamed
syntax enable

func! WordProcessorMode() 
  setlocal formatoptions=1 
  setlocal noexpandtab 
  setlocal spell spelllang=en_us 
  " set thesaurus+=/Users/sbrown/.vim/thesaurus/mthesaur.txt
  set complete+=s
  set formatprg=par
  setlocal wrap 
  setlocal linebreak 
endfu 
com! WP call WordProcessorMode()

colorscheme solarized
set t_Co=256
let g:solarized_contrast="high"    "default value is normal
set background=dark

if has('gui_running')
	set guifont=Inconsolata\ 12
	set lines=50 columns=85
    set guioptions-=T
endif

nnoremap <F2> :set invpaste paste?<CR>
nnoremap ; :
map j gj
map k gk
map <silent> <leader>w :wa <cr>:! make all<cr>
map <leader>c <c-_><c-_>
nmap <leader>cs <c-_><c-_> gUU
nnoremap <leader>m :make
nmap ;ww :w<CR>
noremap <C-k> :bprev<CR> 
noremap <C-l> :bnext<CR> 
nnoremap q; q:
nnoremap ;n :n
nnoremap ! :! 
" nnoremap ,cd :cd %:p:h<CR>
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>em :e Makefile<CR>
nmap <silent> <leader>sv :so $MYVIMRC <CR> :syntax on <CR>
nmap <silent> <leader>bi :BundleInstall<CR>
nmap <silent> <leader>tn :tabn<CR>
nmap <silent> <leader>tp :tabp<CR>
nmap <silent> <leader>sc :tabp<CR>

let g:netrw_keepdir=0 

if has('mouse')
	set mouse=a
endif

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" let g:Tex_DefaultTargetFormat = 'pdf'
" let g:Tex_ViewRule_pdf = 'okular'
" let g:tex_fold_enabled=1
" let g:tex_flavor='latex'
" if has("autocmd")
"   augroup vimrcEx
"   au!
"   autocmd FileType text setlocal textwidth=80
"   autocmd BufReadPost *
"     \ if line("'\"") > 1 && line("'\"") <= line("$") |
			" \   exe "normal! g`\"" |
			" \ endif
"     " 
"     "   augroup END
"     " endif " has("autocmd")
"
"     " if !exists(":DiffOrig")
"     "   command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
"     "       \ | wincmd p | diffthis
"     " endif
"     " 
"     " let g:ipy_completefunc = 'local'
"     " au BufRead *.tex *.Rnw so ~/.vim/after/ftplugin/tex.vim
"
"     " autocmd User fugitive
"     "   \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
"     "   \   nnoremap <buffer> .. :edit %:h<CR> |
"     "   \ endif
"
"     " autocmd BufReadPost fugitive://* set bufhidden=delete
"
"     " set sessionoptions=blank,buffers,curdir,folds,winsize,slash,unix
"     " command! Math w | !command cat "`pwd`/%" | math | grep -v "In\["
"     " au BufRead *.m so ~/.vim/after/ftplugin/mathematica.vim

