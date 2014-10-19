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
Bundle 'rsmenon/vim-mathematica'
Bundle 'bling/vim-airline'
Bundle 'sukima/xmledit'
Bundle 'eshock/vim-matchit'
Bundle 'kien/ctrlp.vim'
Bundle 'SirVer/ultisnips'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'honza/vim-snippets'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/taglist.vim'
Bundle 'fs111/pydoc.vim'
Bundle 'craigemery/vim-autotag'
Bundle 'scrooloose/NERDTree'
Bundle 'reedes/vim-pencil'
Bundle 'reedes/vim-wheel'
Bundle 'valloric/YouCompleteMe'

" Bundle 'Rip-Rip/clang_complete'
" Bundle 'wincent/Command-T'
" Bundle 'scrooloose/syntastic'
" Bundle 'kien/ctrlp'
" Bundle 'ervandew/supertab'
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
set grepprg=ack-grep\ -k
" set t_Co=256
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
" set statusline=%<%f\ %=%-14.(%l,%c%V%)\ %P
syntax sync minlines=10
syntax enable
" let NERDTreeChDirMode=0
let g:C_CFlags="-O3 -std=c++0x -pg -D_DEBUG -g -c -Wall"
let g:ycm_global_ycm_extra_conf = "~/dotfiles/ycm_extra_conf.py"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
" let NERDTreeHijackNetrw=1
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
" cnoreabbrev wq w<bar>bd
" cnoreabbrev bq bp<bar>sp<bar>bn<bar>bd
nnoremap gk :bp<bar>sp<bar>bn<bar>bd <cr>
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
nnoremap <silent> <leader>sy :SyntasticToggleMode<cr>

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
nnoremap <silent> <leader>bi :BundleInstall<CR>
" nnoremap <silent> <leader>o :CommandTJump<CR>
" nnoremap <silent> <leader>sc :tabp<CR>
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
" inoremap <c-d> <esc>ld$a
" nnoremap <c-d> dd
inoremap <c-q> <esc>gqipe
" inoremap <c-u> <esc>bviwUea
" nnoremap <c-u> viwUe
nnoremap <leader>c :!clear <cr><cr>
nnoremap <leader>j Jxxi,<esc>
" map <tab> %
vnoremap <Leader>s :sort<CR>
" Easy copy paste commands
noremap <leader>all ggVG
vnoremap <leader>cop "+y
noremap <leader>pas i<C-r>+ <Esc>
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
  autocmd FileType text call pencil#init({'wrap': 'hard'})
augroup END

augroup randomautocmds
    autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()
    " autocmd BufWinLeave *.* mkview
    " autocmd BufWinEnter *.* silent loadview
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
    au Bufenter,BufNewFile,BufReadPost,BufRead *.m set ft=mma "Mathematica
    au Bufenter,BufNewFile,BufReadPost,BufRead *.Rmd set ft=rmd
    au Bufenter,BufNewFile,BufReadPost,BufRead *.R set ft=r
    au Bufenter,BufNewFile,BufReadPost,BufRead *.Rmd UltiSnipsAddFiletypes r.rmd
    au Bufenter,BufNewFile,BufReadPost,BufRead *.tex set ft=tex
    au Bufenter,BufNewFile,BufReadPost,BufRead *.tex let g:LatexBox_Folding=0
    au Bufenter,BufNewFile,BufReadPost,BufRead *.tex set foldmethod=marker
    au Bufenter,BufNewFile,BufReadPost,BufRead *.cc3d set ft=xml
augroup end
" }}}

" Abbreviations {{{
iabbrev THe The
iabbrev cc3 CompuCell3D
iabbrev arr -->
" }}}

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
