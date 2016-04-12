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
Plugin 'rsmenon/vim-mathematica'
Plugin 'sukima/xmledit'
Plugin 'eshock/vim-matchit'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'SirVer/ultisnips'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'honza/vim-snippets'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'fs111/pydoc.vim'
Plugin 'craigemery/vim-autotag'
Plugin 'reedes/vim-pencil'
Plugin 'reedes/vim-wheel'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'epeli/slimux'
Plugin 'valloric/YouCompleteMe'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'Vim-R-plugin'
Plugin 'jalvesaq/R-Vim-runtime'
Plugin 'chiedo/vim-dr-replace'
" Plugin 'jalvesaq/Nvim-R'
" Plugin 'tpope/vim-vinegar'
" Plugin 'scrooloose/NERDTree'
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
set tabstop=4
set expandtab
set autoindent
set hlsearch
" set softtabstop=4
set sw=0
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
" set t_Co=256
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
" set statusline=%<%f\ %=%-14.(%l,%c%V%)\ %P
syntax sync minlines=10
syntax enable
set background=dark
set t_Co=256
colorscheme smyck
" colorscheme southernlights
" colorscheme solarized

" let g:netrw_liststyle=3
" let NERDTreeChDirMode=0
let g:C_CFlags="-O3 -std=c++0x -pg -D_DEBUG -g -c -Wall"
let g:ycm_global_ycm_extra_conf="~/dotfiles/ycm_extra_conf.py"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
" let NERDTreeHijackNetrw=1
let g:mma_highlight_option = "solarized"
let g:mma_candy=1
" set encoding=utf-8

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
" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add
" Always use vertical diffs
set diffopt+=vertical

" syntastic settings
let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': [],
                          \ 'passive_filetypes': []}
" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:snips_author="Maarten Slagter"
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
" }}}

" Functions {{{
" function! OpenCC3DSim()
"   SyntasticToggleMode
"   e dir/Simulation/*.py
"   echomsg "Ran my command"
" endfunction
"

function! InspectDataFile()
    setlocal list
    setlocal nowrap
endfunction

function! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction

function! WordProcessorMode()
    setlocal textwidth=80
    setlocal linebreak
    " Auto-wrap using textwidth, both text and comments
    setlocal formatoptions=tc
    " Automatically insert current comment leader
    setlocal formatoptions+=ro
    setlocal formatoptions+=qw
    setlocal formatoptions+=b
    setlocal formatoptions+=m
    setlocal formatoptions+=1j
    setlocal formatoptions+=2
    setlocal formatoptions+=an
    setlocal spell spelllang=en_us,nl
    " setlocal thesaurus+=~/mthesaur.txt
    setlocal complete+=s
endfunction

function! TsvViewerMode()
    setlocal nowrap
    setlocal number
    setlocal noexpandtab
    setlocal list
    setlocal nostartofline
    " :Tabularize /,
    :Tabularize /\v\t|,/
    " :Tabularize /;
    " :% s/,/\t/g
endfunction

function! ResetSyntax()
    " TeX syntax tends to freeze, confusing everything to be in mathmode
    echom "Syntax reset!"
    syntax off
    syntax on
endfunction

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
let maplocalleader = ","
map ' `
let g:pencil#wrapModeDefault = 'soft'   " or 'soft'
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
nnoremap <silent><leader>cp :let @+ = expand("%:p")<cr><cr>
nnoremap <c-b> :CtrlPBuffer <cr>

nnoremap ; :
nnoremap j gj
nnoremap k gk
" nnoremap <silent> gk :bp<bar>sp<bar>bn<bar>bd <cr>
" nnoremap gk :bp <bar> sp <bar> silent! bn <bar> bd <CR>
nnoremap <silent> gd :bw<cr>
nnoremap <silent> gk :bw!<cr>
nnoremap <silent> <leader>qq :q!<cr>

nnoremap <silent> gl :bn<cr>
nnoremap <silent> gh :bp<cr>
nnoremap <silent> <leader>w :wa <cr>:! make all<cr>
nnoremap q; q:
nnoremap <silent> <leader>sy :SyntasticToggleMode<cr>
" clean tabs of surrounding whitespaces
nnoremap <leader>ct :% s/\s*\t\s*/\t/g<CR>

nnoremap <leader>m :wa <cr> :make <cr>
nnoremap <leader>y :call ResetSyntax() <cr>
nnoremap <leader>tv :call TsvViewerMode() <cr>
" nnoremap <F5> :e!<cr>
" nnoremap <leader>cs <c-_><c-_> gUU
nnoremap ;w :w<CR>
nnoremap ;aw :wa<CR>

" Explore local directory
nnoremap <leader>ex :e .<cr>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
" nnoremap <leader>el :Lexplore %:p:h<CR>
nnoremap <leader>el :CtrlP %:p:h<CR>
" nnoremap <leader>mb :%s/\.\(\s\+\|$\)/.\r/g

nnoremap <leader>gca :Gcommit --amend<CR>
nnoremap ;n :n
nnoremap ! :!
" nnoremap H ^
" vnoremap L $
" Sync project to remote, define syncto and syncfrom functions in project folder
command! WP call WordProcessorMode()
nmap maartenedit  :e
" Have to be sure that this command won't be found in any plugins, so give it
" a super goofy name: maartenedit
nmap maartenedit  :e
nmap <leader>es maartenedit ~/dotfiles/aliases.sh<CR>
nmap <leader>ec :CtrlP ~/dotfiles/vim/custom/<CR>
nmap <leader>ed :CtrlP ~/dotfiles<CR>
nnoremap <leader>eb :split ~/labbook.md<CR>
nmap <leader>em maartenedit Makefile<CR>
nmap <leader>ev maartenedit ~/dotfiles/vimrc<CR>
nmap <leader>sv :source ~/dotfiles/vimrc<CR>
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
nnoremap <leader>gca :Git commit --amend<CR>
nnoremap <leader>gst :Gstatus<CR>
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
    autocmd! bufwritepost ~/dotfiles/vimrc source ~/dotfiles/vimrc
    " autocmd BufEnter * silent! lcd %:p:h
    " au FocusLost * :silent! wall
    au FocusLost * :wall
    " Resize splits when the window is resized
    au VimResized * :wincmd =
    " autocmd vimenter * if !argc() | NERDTree | endif
augroup END

augroup filetypechecking
    au Bufenter,BufNewFile,BufReadPost,BufRead *.md set filetype=markdown
    au Bufenter,BufNewFile,BufReadPost,BufRead *.m set ft=mma "Mathematica
    au Bufenter,BufNewFile,BufReadPost,BufRead *.Rmd set ft=rmd
    au Bufenter,BufNewFile,BufReadPost,BufRead *.R set ft=r
    " au Bufenter,BufNewFile,BufReadPost,BufRead *.Rmd UltiSnipsAddFiletypes r.rmd
    au Bufenter,BufNewFile,BufReadPost,BufRead *.cc3d set ft=xml
    au Bufenter,BufNewFile,BufReadPost,BufRead *.gtf :call InspectDataFile()
    au Bufenter,BufNewFile,BufReadPost,BufRead *.bed :call InspectDataFile()
    au Bufenter,BufNewFile,BufReadPost,BufRead *.tsv :call InspectDataFile()
    au Bufenter,BufNewFile,BufReadPost,BufRead *.csv :call InspectDataFile()
    au Bufenter,BufNewFile,BufReadPost,BufRead *.maf :call InspectDataFile()
    " au Bufenter,BufNewFile,BufReadPost,BufRead *.gtf setlocal list
    " au Bufenter,BufNewFile,BufReadPost,BufRead *.gtf setlocal nowrap
    " au Bufenter,BufNewFile,BufReadPost,BufRead *.bed setlocal list
    " au Bufenter,BufNewFile,BufReadPost,BufRead *.bed setlocal nowrap
augroup end

augroup notR
  nnoremap <space> :SlimuxREPLSendLine<CR> <bar> j
  nnoremap <Leader>l :SlimuxREPLSendLine<CR>
  nnoremap <Leader>aa :SlimuxREPLSendBuffer<CR>
  nnoremap <Leader>pp :SlimuxREPLSendParagraph<CR>
  nnoremap <Leader>bq :SlimuxSendKeys 'Q' <CR> <bar> :SlimuxSendKeys 'Enter'<CR>
  nnoremap <Leader>c :SlimuxSendKeys 'C-C'<CR>
  vnoremap <space> :SlimuxREPLSendSelection<CR> <bar> :SlimuxSendKeys 'Enter'<CR>
augroup end
" }}}

" Abbreviations {{{
iabbrev THe The
iabbrev cc3 CompuCell3D
iabbrev arrow -->
" }}}

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
" map <silent> <C-n> :call ToggleVExplorer()<CR>

" Local config
let g:localvimrc=fnamemodify('.vimrc.local', ':p')
if filereadable(g:localvimrc)
  execute "source" . g:localvimrc
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
