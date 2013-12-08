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
Bundle "slagtermaarten/ultisnips"
Bundle "Raimondi/delimitMate"
Bundle "altercation/vim-colors-solarized"
Bundle "nelstrom/vim-markdown-folding"
Bundle 'L9'
Bundle 'tComment'
Bundle 'c.vim'
Bundle 'Vim-R-plugin'
Bundle 'wincent/Command-T'
Bundle 'rsmenon/vim-mathematica'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
" Bundle 'klen/python-mode'
" Bundle "snipmate-snippets"
" Bundle "garbas/vim-snipmate"
" Bundle "SirVer/ultisnips"

" au Bufenter,BufNewFile,BufReadPost *.py let g:pymode = 1
" au Bufenter,BufNewFile,BufReadPost *.py let g:pymode_run_key = 'R'
" au Bufenter,BufNewFile,BufReadPost *.py let g:pymode_lint_write = 0
" au Bufenter,BufNewFile,BufReadPost *.py let g:pymode_doc = 1
" au Bufenter,BufNewFile,BufReadPost *.py let g:pymode_doc_key = 'K'
" au Bufenter,BufNewFile,BufReadPost *.py let g:pymode_run = 1
" au Bufenter,BufNewFile,BufReadPost *.py let g:pymode_run_key = '<leader>r'
" map <Leader>b Oimport ipdb; ipdb.set_trace()  # BREAKPOINT<C-c>
autocmd BufEnter * silent! lcd %:p:h
let mapleader = ","

let g:mma_highlight_option = "solarized"
let g:mma_candy = 1

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
" set backspace=indent,eol,start
set pastetoggle=<F2>
set clipboard=unnamed
set showmode
set bs=2
set hidden
set laststatus=2
set tabstop=4
set expandtab
set autoindent
set shiftround
set nocursorcolumn
set nocursorline
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
set autochdir
set so=10
set colorcolumn=80
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set statusline=%<%f\ %=%-14.(%l,%c%V%)\ %P
" set foldmethod=manual
" set formatprg=par
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
syntax sync minlines=10
syntax enable
let vimrplugin_screenplugin = 0

func! WordProcessorMode() 
    " setlocal formatoptions=1 
    " setlocal noexpandtab 
    set formatoptions+="tpcqa"
    setlocal spell spelllang=en_us 
    " set thesaurus+=/Users/sbrown/.vim/thesaurus/mthesaur.txt
    " set complete+=s
endfu 
com! WP call WordProcessorMode()

set t_Co=256
" set background=dark
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" au InsertLeave * match ExtraWhitespace /\s\+$/

if has('gui_running')
    colorscheme solarized
    let g:solarized_contrast="high"
    set guifont=Inconsolata\ 11
    set lines=30 columns=80
    set lines=50 columns=85
    set guioptions-=T
endif

" nnoremap <F2> :set invpaste paste?<CR>
vmap <F4> y:execute "%s/".escape(@",'[]/')."//gc"<Left><Left><Left><Left>
nnoremap ; :
map j gj
map k gk
map <silent> <leader>w :wa <cr>:! make all<cr>
map <leader>c <c-_><c-_>
map <F5> :e!<cr>
nmap <leader>cs <c-_><c-_> gUU
nnoremap <leader>m :make
nmap ;ww :w<CR>
noremap <C-k> :bprev<CR> 
noremap <C-l> :bnext<CR> 
nnoremap q; q:
nnoremap ;n :n
nnoremap ! :! 
" nnoremap ,cd :cd %:p:h<CR>
" nmap <silent> <leader>bi :BundleInstall<CR>
nmap <silent> <leader>em :e Makefile<CR>
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>o :CommandTJump<CR>
nmap <silent> <leader>sc :tabp<CR>
nmap <silent> <leader>sv :so $MYVIMRC <CR> :syntax on <CR>
nmap <silent> <leader>tn :tabn<CR>
nmap <silent> <leader>tp :tabp<CR>
" inoremap <C-n> :nohl<CR>
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
vnoremap < <gv
vnoremap > >gv
vmap Q gq
nmap Q gqap

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,python,tex autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

let g:netrw_keepdir=0 
let mapleader=","
vnoremap <Leader>s :sort<CR>

if has('mouse')
    set mouse=a
endif

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
autocmd! bufwritepost .vimrc source %

" command! Math w | !command cat "`pwd`/%" | math | grep -v "In\["
" au BufRead *.m so ~/.vim/after/ftplugin/mathematica.vim

