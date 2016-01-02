set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/custom
call vundle#begin()
set shell=/bin/bash
" Plugins {{{
Plugin 'gmarik/vundle'
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'L9'
Plugin 'tComment'
Plugin 'c.vim'
Plugin 'jalvesaq/R-Vim-runtime'
Plugin 'Vim-R-plugin'
Plugin 'rsmenon/vim-mathematica'
Plugin 'sukima/xmledit'
Plugin 'eshock/vim-matchit'
Plugin 'kien/ctrlp.vim'
Plugin 'SirVer/ultisnips'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'honza/vim-snippets'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'fs111/pydoc.vim'
Plugin 'craigemery/vim-autotag'
" Plugin 'scrooloose/NERDTree'
Plugin 'reedes/vim-pencil'
Plugin 'reedes/vim-wheel'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'epeli/slimux'
Plugin 'valloric/YouCompleteMe'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-vinegar'

" Plugin 'Rip-Rip/clang_complete'
" Plugin 'bling/vim-airline'
" Plugin 'wincent/Command-T'
" Plugin 'scrooloose/syntastic'
" Plugin 'ervandew/supertab'
" Plugin 'matze/vim-tex-fold'
" Plugin 'klen/python-mode'
" Plugin 'ivanov/vim-ipython'
" Plugin 'johndgiese/vipy'

call vundle#end()
filetype plugin indent on
" }}}

" Settings {{{
set pastetoggle=<F2>
" set listchars
set clipboard=unnamed
set showmode
set autoread
set bs=2
set ruler
set hidden
set laststatus=2
set tabstop=2
set expandtab
set autoindent
set hlsearch
set softtabstop=2
set sw=2
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
set equalalways
set colorcolumn=
set grepprg=ack\ -k
" set t_Co=256
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
" set statusline=%<%f\ %=%-14.(%l,%c%V%)\ %P
syntax sync minlines=10
syntax enable
set background=dark
set t_Co=256
colorscheme smyck
" colorscheme solarized

" let NERDTreeChDirMode=0
let g:C_CFlags="-O3 -std=c++0x -pg -D_DEBUG -g -c -Wall"
let g:ycm_global_ycm_extra_conf = "~/dotfiles/ycm_extra_conf.py"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
" let NERDTreeHijackNetrw=1
let g:mma_highlight_option = "solarized"
let g:mma_candy=1
set encoding=utf-8
" let g:airline_powerline_fonts=1
" let g:airline#extensions#bufferline#enabled=1
" let g:airline#extensions#bufferline#overwrite_variables=1
" let g:airline#extensions#tabline#left_alt_sep='|'
" let g:airline_section_b='%{strftime("%H:%M")}'
" let g:airline_section_y='BN %{bufnr("%")}'
" let g:UltiSnipsEditSplit="vertical"
"" let g:UltiSnipsUsePythonVersion=
" let g:clang_library_path= '/usr/lib/llvm-3.2/lib'
set foldmethod=marker
set tags=./tags;$HOME
" set tags+=$HOME/CompuCell3D/CompuCell3D/core
" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add
" Always use vertical diffs
set diffopt+=vertical

" syntastic settings
let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': [],'passive_filetypes': []}
" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
" }}}

" Functions {{{
" function! OpenCC3DSim()
"   SyntasticToggleMode
"   e dir/Simulation/*.py
"   echomsg "Ran my command"
" endfunction
"
fun! GetGitCommit()
    " let l = !git log
    let l = system("git log | awk 'NR == 1 {printf \"%s\", $2; exit;}'")
    return l
endfunction

fun! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction

fun! WordProcessorMode()
    setlocal textwidth=80
    set linebreak
    setlocal formatoptions=1tcrqan
    " setlocal spell spelllang=en_us,nl,medical
    set thesaurus+=~/mthesaur.txt
    " set complete+=s
endfu

fun! ResetSyntax()
    " TeX syntax tends to freeze, confusing everything to be in mathmode
    echom "Syntax reset!"
    syntax off
    syntax on
endfun

" Move current tab into the specified direction.
" @param direction -1 for left, 1 for right.
function! TabMove(direction)
    " get number of tab pages.
    let ntp=tabpagenr("$")
    " move tab, if necessary.
    if ntp > 1
        " get number of current tab page.
        let ctpn=tabpagenr()
        " move left.
        if a:direction < 0
            let index=((ctpn-1+ntp-1)%ntp)
        else
            let index=(ctpn%ntp)
        endif

        " move tab page.
        execute "tabmove ".index
    endif
endfunction
" }}}

" Mappings {{{
let mapleader = ","
" let maplocalleader = "\\"
let maplocalleader = ","
let g:pencil#wrapModeDefault = 'soft'   " or 'soft'
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
" map <C-n> :NERDTreeToggle<CR>
" map <C-m> :NERDTreeFind<CR>
nnoremap gk :bp<bar>sp<bar>bn<bar>bd <cr>
nnoremap <leader>cp :let @+ = expand("%:p")<cr>
nnoremap <c-b> :CtrlPBuffer <cr>
" cnoreabbrev q bd
vnoremap <F4> y:execute "%s/".escape(@",'[]/')."//gc"<Left><Left><Left><Left>
nnoremap ; :
nnoremap j gj
nnoremap k gk
nnoremap gl :bn<cr>
nnoremap gh :bp<cr>
nnoremap gd :bd<cr>
nnoremap gk :bp <bar> sp <bar> silent! bn <bar> bd <CR>
nnoremap <leader>ex :e .<cr>
nnoremap <silent> <leader>w :wa <cr>:! make all<cr>
nnoremap <silent> qq :q!
noremap <silent> <leader>sy :SyntasticToggleMode<cr>

" Slimex mappings {{{
map <Leader><space> :SlimuxREPLSendLine<CR> <bar> j
map <Leader>s :SlimuxREPLSendLine<CR>
vmap <Leader><space> :SlimuxREPLSendSelection<CR>
map <Leader>aa :SlimuxREPLSendBuffer<CR>
map <Leader>pp :SlimuxREPLSendParagraph<CR>
map <Leader>a :SlimuxShellLast<CR>
map <Leader>k :SlimuxSendKeysLast<CR>
" }}}

nnoremap <leader>m :wa <cr> :make <cr>
nnoremap <leader>c <c-_><c-_>
nnoremap <leader>y :call ResetSyntax() <cr>
" nnoremap <F5> :e!<cr>
" nnoremap <leader>cs <c-_><c-_> gUU
nnoremap ;ww :w<CR>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
" nnoremap <leader>mb :%s/\.\(\s\+\|$\)/.\r/g
nnoremap q; q:
nnoremap ;q :q
nnoremap ;n :n
nnoremap ! :!
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $
" Sync project to remote, define syncto and syncfrom functions in project folder
nnoremap <leader>st :! zsh -ci syncto <CR>
nnoremap <leader>sf :! zsh -ci syncfrom <CR>
com! WP call WordProcessorMode()
" Have to be sure that this command won't be found in any plugins, so give it
" a super goofy name: maartenedit
nmap maartenedit  :e
nmap <leader>es maartenedit ~/dotfiles/aliases.sh<CR>
nmap <leader>ec maartenedit ~/current/<CR>
nmap <leader>ed maartenedit ~/dotfiles<CR>
nmap <leader>eb maartenedit ~/dotfiles/bin<CR>
nmap <leader>em maartenedit Makefile<CR>
nmap <leader>ev maartenedit ~/dotfiles/vimrc<CR>
nmap <leader>eg maartenedit ~/.gitconfig<CR>
nmap <leader>ea maartenedit ~/.config/awesome/rc.lua <CR>
nmap <leader>et maartenedit ~/dotfiles/tmux.conf <CR>
nmap <leader>ef maartenedit ~/.vim/custom/ftplugin <CR>
nmap <leader>nh :nohl<cr>
nnoremap <silent> <leader>bi :PluginInstall<CR>
" nnoremap <silent> <leader>o :CommandTJump<CR>
" nnoremap <silent> <leader>sc :tabp<CR>
" nnoremap <leader>pa :! pandoc % | :! xclip

" nnoremap <silent><leader>t :TlistToggle <cr>
" nnoremap <leader>pa :! pandoc % | :! xclip

" nnoremap <silent> <leader>tn :tabn<CR>
" nnoremap <silent> <leader>tp :tabp<CR>
" nnoremap <silent> <leader>a za
vnoremap < <gv
vnoremap > >gv
nnoremap Q gqap
vnoremap Q gq
" inoremap <c-d> <esc>ld$a
" nnoremap <c-d> dd
inoremap <c-q> <esc>gqipe
" inoremap <c-u> <esc>bviwUea
" nnoremap <c-u> viwUe
nnoremap <leader>c :!clear <cr><cr>
nnoremap <leader>j Jxxi,<esc>
" map <tab> %
" vnoremap <Leader>s :sort<CR>
" Easy copy paste commands
noremap <leader>all ggVG
vnoremap <leader>cop "+y
noremap <leader>pas i<C-r>+ <Esc>
" if exists(":Tabularize")
"   " nmap <Leader>a= :Tabularize /=<CR>
"   " vmap <Leader>a= :Tabularize /=<CR>
"   " nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>ta :Tabularize /\t<CR>
nmap <Leader>ta :Tabularize /\t<CR>
" endif

" }}}

" Mouse {{{
if has('mouse')
    set mouse=a
endif
" }}}

" Autocommands{{{
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType textile call pencil#init()
  autocmd FileType text call pencil#init({'wrap': 'soft'})
augroup END

augroup randomautocmds
    autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()
    " autocmd BufWinLeave *.* mkview
    " autocmd BufWinEnter *.* silent loadview
    " autocmd BufWinEnter *.* :NERDTreeCWD
    autocmd! bufwritepost ~/dotfiles/vimrc source %
    autocmd BufEnter * silent! lcd %:p:h
    " au FocusLost * :silent! wall
    au FocusLost * :wall
    " Resize splits when the window is resized
    au VimResized * :wincmd =
    " autocmd vimenter * if !argc() | NERDTree | endif
augroup END

augroup pymode
    au Bufenter,BufNewFile,BufReadPost *.py let g:pymode = 0
    au Bufenter,BufNewFile,BufReadPost *.py map <Leader>de oimport pudb; pudb.set_trace()  # BREAKPOINT<C-c>
augroup end

augroup filetypechecking
    au Bufenter,BufNewFile,BufReadPost,BufRead *.md set filetype=markdown
    au Bufenter,BufNewFile,BufReadPost,BufRead *.m set ft=mma "Mathematica
    au Bufenter,BufNewFile,BufReadPost,BufRead *.Rmd set ft=rmd
    au Bufenter,BufNewFile,BufReadPost,BufRead *.R set ft=r
    " au Bufenter,BufNewFile,BufReadPost,BufRead *.Rmd UltiSnipsAddFiletypes r.rmd
    au Bufenter,BufNewFile,BufReadPost,BufRead *.tex set ft=tex
    au Bufenter,BufNewFile,BufReadPost,BufRead *.tex let g:LatexBox_Folding=0
    au Bufenter,BufNewFile,BufReadPost,BufRead *.tex set foldmethod=marker
    au Bufenter,BufNewFile,BufReadPost,BufRead *.cc3d set ft=xml
    au Bufenter,BufNewFile,BufReadPost,BufRead *.gtf setlocal list
    au Bufenter,BufNewFile,BufReadPost,BufRead *.gtf setlocal nowrap
    au Bufenter,BufNewFile,BufReadPost,BufRead *.bed setlocal list
    au Bufenter,BufNewFile,BufReadPost,BufRead *.bed setlocal nowrap
    au Bufenter,BufNewFile,BufReadPost,BufRead *.tsv setlocal list
    au Bufenter,BufNewFile,BufReadPost,BufRead *.tsv setlocal nowrap
    au Bufenter,BufNewFile,BufReadPost,BufRead *.csv setlocal list
    au Bufenter,BufNewFile,BufReadPost,BufRead *.csv setlocal nowrap
    au Bufenter,BufNewFile,BufReadPost,BufRead *.maf setlocal list
    au Bufenter,BufNewFile,BufReadPost,BufRead *.maf setlocal nowrap
    au Bufenter,BufNewFile,BufReadPost,BufRead *.txt setlocal list
    au Bufenter,BufNewFile,BufReadPost,BufRead *.txt setlocal nowrap
    " au Bufenter,BufNewFile,BufReadPost,BufRead *.gtf setlocal list
    " au Bufenter,BufNewFile,BufReadPost,BufRead *.gtf setlocal nowrap
    " au Bufenter,BufNewFile,BufReadPost,BufRead *.bed setlocal list
    " au Bufenter,BufNewFile,BufReadPost,BufRead *.bed setlocal nowrap
augroup end
" }}}

" Abbreviations {{{
iabbrev THe The
iabbrev cc3 CompuCell3D
iabbrev arrow -->
iabbrev <expr> dts strftime("%c")
iabbrev <expr> gitc GetGitCommit()
" }}}


" Local config
let g:localvimrc=fnamemodify('.vimrc.local', ':p')
if filereadable(g:localvimrc)
  execute "source" . g:localvimrc
endif
