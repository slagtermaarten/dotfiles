
set nocompatible
filetype off
syntax enable
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin on
filetype indent on

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "snipmate-snippets"
Bundle "garbas/vim-snipmate"
Bundle "Raimondi/delimitMate"
Bundle "altercation/vim-colors-solarized.git"
Bundle 'L9'
" Bundle 'fugitive.vim' A tad hazardous in the hands of a novice git user like
" me
Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
Bundle 'tComment'
Bundle 'c.vim'
Bundle 'Vim-R-plugin'

au BufNewFile,BufReadPost *.tex set syntax=tex
au Bufenter,BufNewFile,BufReadPost *.hs compiler ghc
au BufRead,BufNewFile,BufReadPost *.txt,*.tex set
" thesaurus+=~/.vim/thesaurus/mthesaur.txt 

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
set foldlevelstart=2
set wildmenu
set wildignore=*.o,a.out,*.bbl,*.pdf
set autochdir
set so=10
set paste
set wrap
set linebreak
set textwidth=80
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set statusline=%<%f\ %=%-14.(%l,%c%V%)\ %P
set foldmethod=manual
set formatoptions+="tpcqa"
syntax sync minlines=10
syntax enable

colorscheme solarized
" let g:solarized_contrast="high"    "default value is normal
set background=dark

if has('gui_running')
	let g:solarized_contrast="high"    "default value is normal
	" set guifont=Inconsolata\ 10
	"
	set lines=40 columns=82
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
nnoremap ,cd :cd %:p:h<CR>
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>em :e Makefile<CR>
nmap <silent> <leader>sv :so $MYVIMRC <CR> :syntax on <CR>
nmap <silent> <leader>bi :BundleInstall<CR>
nmap <silent> <leader>tn :tabn<CR>
nmap <silent> <leader>tp :tabp<CR>
nmap <silent> <leader>sc :tabp<CR>

let g:netrw_keepdir=0 
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'okular'
let g:tex_fold_enabled=1
let g:tex_flavor='latex'

if has('mouse')
	set mouse=a
endif

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
"     " au BufWinLeave *.tex mkview
"     " au BufWinEnter *.tex silent loadview
"     " command! Math w | !command cat "`pwd`/%" | math | grep -v "In\["
"     " au BufRead *.m so ~/.vim/after/ftplugin/mathematica.vim

" This beauty remembers where you were the last time you edited the
" file, and returns to the same position.
" au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
