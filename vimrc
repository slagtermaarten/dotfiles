set nocompatible
set rtp+=~/.vim/custom
set shell=/bin/bash

" Plugins {{{
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'mileszs/ack.vim'
" Plug 'rking/ag.vim', { 'on' : 'Ag' }
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'altercation/vim-colors-solarized'
Plug 'L9'
Plug 'tComment'
Plug 'eshock/vim-matchit'
Plug 'ctrlpvim/ctrlp.vim', { 'on' : ['CtrlP', 'CtrlPDir', 'CtrlPMRUFiles', 'CtrlPBuffer'] }
Plug 'SirVer/ultisnips'
Plug 'godlygeek/tabular'
" Plug 'godlygeek/tabular', { 'for' : 'markdown' }
Plug 'honza/vim-snippets'
Plug 'vim-scripts/taglist.vim'
Plug 'fs111/pydoc.vim', { 'for' : 'python' }
Plug 'craigemery/vim-autotag'
Plug 'reedes/vim-pencil' ", { 'on' : ['SoftPencil', 'HardPencil'] }
Plug 'tpope/vim-fugitive'
Plug 'reedes/vim-wheel'
Plug 'christoomey/vim-tmux-navigator'
Plug 'c.vim', { 'for' : ['c', 'cpp'] }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'nelstrom/vim-markdown-folding', { 'for' : 'markdown' }
Plug 'vim-pandoc/vim-pandoc', { 'for' : 'markdown' }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for' : 'markdown' }
Plug 'rsmenon/vim-mathematica', { 'for' : 'mathematica' }
Plug 'dhruvasagar/vim-table-mode', { 'for' : 'markdown' }
Plug 'sukima/xmledit', { 'for' : 'xml' }
" Plug 'epeli/slimux', { 'for' : ['zsh', 'sh', 'bash', 'markdown'] }
Plug 'epeli/slimux'
Plug 'jalvesaq/Nvim-R', { 'for' : ['r', 'rmd'] }
Plug 'moll/vim-bbye'

" Plug 'chiedo/vim-dr-replace'
" Plug 'valloric/YouCompleteMe'
" Plug 'jpalardy/vim-slime'
" Plug 'LaTeX-Box-Team/LaTeX-Box'
" Plug 'tpope/vim-vinegar'
" Plug 'Rip-Rip/clang_complete'
" Plug 'bling/vim-airline'
" Plug 'wincent/Command-T'
" Plug 'scrooloose/syntastic'
" Plug 'ervandew/supertab'
" Plug 'matze/vim-tex-fold'
" Plug 'klen/python-mode'
" Plug 'ivanov/vim-ipython'
" Plug 'johndgiese/vipy'
call plug#end()
" }}}

" Settings {{{
" set listchars
" if $TMUX == ''
" set clipboard=unnamed
" endif
set showmode
set autoread
set bs=2
set ruler
set hidden
set laststatus=2
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set hlsearch
set incsearch
set nobackup
set noswapfile
set noerrorbells
set wildignore=*.swp,*.bak,*.pyc,*.class,*.rds,*.html,*.Rdata,*.Rds
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
set colorcolumn=80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
" set t_Co=256
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
" set statusline=%<%f\ %=%-14.(%l,%c%V%)\ %P
syntax sync minlines=10
syntax enable
set background=light
set t_Co=256
" colorscheme smyck
" colorscheme southernlights
" colorscheme solarized

" set vim-r-plugin to indent in a sane way
let r_indent_align_args = 1
let r_indent_ess_comments = 1
let r_indent_ess_compatible = 1
let g:netrw_liststyle=3
let NERDTreeChDirMode=0
let R_in_buffer = 0
let R_applescript = 0
let R_tmux_split = 1
let g:C_CFlags="-O3 -std=c++0x -pg -D_DEBUG -g -c -Wall"
let g:ycm_global_ycm_extra_conf="~/dotfiles/ycm_extra_conf.py"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let NERDTreeHijackNetrw=1
let g:mma_highlight_option = "solarized"
let g:mma_candy=1
let vimrplugin_assign=0
set guifont=Monaco:h13
" set encoding=utf-8
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-i> :TmuxNavigatePrevious<cr>

" Sending stuff to tmux panes {{{
if exists('g:loaded_slime')
  let g:slimux_select_from_current_window=1
  " echo "slime loaded"
  let g:slime_target = "tmux"
  let g:slime_paste_file = tempname()
  let g:slime_defaull_config = {"socket_name": "default", "target_pane": "1"}
  xmap <leader>sl :SlimeSend<CR>
  " vmap <leader>d :SlimeSend<CR>
endif
"}}}

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
  let g:ackprg = 'ag --vimgrep'

  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ -G\ libs

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
  nnoremap <leader>sw :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
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
    setlocal formatoptions+=n
    "" Automatic (paragraph and text width) formatting
    setlocal formatoptions+=a
    setlocal spell spelllang=en_us
    " setlocal thesaurus+=~/mthesaur.txt
    setlocal complete+=s
endfunction

function! ViewerMode()
    setlocal nowrap
    setlocal number
    setlocal noexpandtab
    setlocal list
    setlocal nostartofline
endfunction

function! TsvViewerMode()
    call ViewerMode()
    " :Tabularize /,
    :Tabularize /\t/
    " :Tabularize /;
    " :% s/,/\t/g
endfunction

function! CsvViewerMode()
    call ViewerMode()
    :Tabularize /,/
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
nnoremap <c-m> :CtrlPMRUFiles <cr>
nnoremap <c-b> :CtrlPBuffer <cr>
nnoremap <c-n> :NERDTreeToggle<CR>
nnoremap ; :
nnoremap j gj
" nnoremap k gk
nnoremap <silent> gk :bp<bar>sp<bar>bn<bar>bd <cr>
" nnoremap gk :bp <bar> sp <bar> silent! bn <bar> bd <CR>
nnoremap <silent> gd :bn <bar> bd #<cr>
nnoremap <silent> gk :bw!<cr>

nnoremap <silent> gl :bn<cr>
nnoremap <silent> gh :bp<cr>
nnoremap <silent> <leader>w :wa <cr>:! make all<cr>
nnoremap q; q:
nnoremap <silent> <leader>sy :SyntasticToggleMode<cr>
" clean tabs of surrounding whitespaces
nnoremap <leader>ct :% s/\s*\t\s*/\t/g<CR>

nnoremap <leader>cdp :cd ~/current_project <CR>
nnoremap <leader>m :wa <cr> :make <cr>
nnoremap <leader>y :call ResetSyntax() <cr>
nnoremap <leader>tv :call TsvViewerMode() <cr>
" nnoremap <F5> :e!<cr>
" nnoremap <leader>cs <c-_><c-_> gUU
nnoremap ;w :w<CR>
nnoremap ;aw :wa<CR>

" Explore local directory
nnoremap <leader>ex :e .<cr>
" nnoremap <leader>ccd :cd %:p:h<CR>:pwd<CR>
" nnoremap <leader>el :Lexplore %:p:h<CR>
nnoremap <leader>el :CtrlP %:p:h<CR>
" nnoremap <leader>mb :%s/\.\(\s\+\|$\)/.\r/g
" Get filename of current buffer into clipboard
nmap <leader>fs :let @*=expand("%")<CR>
nmap <leader>fl :let @*=expand("%:p")<CR>

nnoremap ;n :n
nnoremap ! :!
" nnoremap H ^
" vnoremap L $
" Sync project to remote, define syncto and syncfrom functions in project folder
command! WP call WordProcessorMode()
command! Gfix :Gcommit --amend
nmap maartenedit  :e
" Have to be sure that this command won't be found in any plugins, so give it
" a super goofy name: maartenedit
nmap maartenedit  :split
nmap <leader>es maartenedit ~/dotfiles/aliases.sh<CR>
nmap <leader>ec :CtrlP ~/dotfiles/vim/custom/<CR>
nmap <leader>ed :CtrlP ~/dotfiles<CR>
nnoremap <leader>eb :split ~/antigenic_space/maarten-analyses/labbook.md<CR>
nmap <leader>em maartenedit Makefile<CR>
nmap <leader>ev maartenedit ~/dotfiles/vimrc<CR>
nmap <leader>sv :source ~/.vimrc<CR>
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
nnoremap <leader>pas :set !paste <bar> i<C-r>+ <Esc> <bar>
" if exists(":Tabularize")
"   " nmap <Leader>a= :Tabularize /=<CR>
"   " vmap <Leader>a= :Tabularize /=<CR>
"   " nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>ta :Tabularize /\t<CR>
nmap <Leader>ta :Tabularize /\t<CR>
" I've developed a great aesthetic preference for single brackets over double
" brackets (mostly working on R code for the moment)
nnoremap <leader>rdb :s/"/'/g<CR> <bar> :nohl <CR>
vnoremap <leader>rdb :s/"/'/g<CR> <bar> :nohl <CR>
" Increment all numbers by 1 on current line
nnoremap <leader>in :s/\d\+/\=(submatch(0)+1)/g<CR> <bar> :nohl <CR>
" endif
nnoremap <leader>stw :call StripTrailingWhitespaces() <CR>
" nnoremap <c-h> <c-w><c-h>
" nnoremap <c-j> <c-w><c-j>
" nnoremap <c-k> <c-w><c-k>
" nnoremap <c-l> <c-w><c-l>
" }}}

" Copying and pasting {{{
set pastetoggle=<F2>
" nnoremap Y "tY
" nnoremap y "ty
" vnoremap y "ty
" nnoremap P "tP
" nnoremap p "tp
" vnoremap p "tp
" nnoremap d "td
" vnoremap d "td
" }}}

" {{{ Git/fugitive mappings
nnoremap <Leader>st :Gstatus<CR>
nnoremap <leader>ca :Git commit --amend<CR>
" }}}

" Mouse {{{
if has('mouse')
    set mouse=a
endif
" }}}

" Autocommands{{{
augroup pencil
  autocmd!
  " autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType markdown,mkd call pencil#init({'wrap': 'hard'})
  autocmd FileType textile call pencil#init()
  autocmd FileType text call pencil#init({'wrap': 'hard'})
augroup END

augroup misc_autocmds
    " autocmd! BufRead,BufEnter,BufWritePost *.R *.Rmd *.md call FollowSymlink() |
    "       \ :call SetProjectRoot()
    autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()
    " autocmd BufWinLeave *.* mkview
    " autocmd BufWinEnter *.* silent loadview
    " autocmd BufWinEnter *.* :NERDTreeCWD
    autocmd! bufwritepost ~/dotfiles/vimrc source ~/dotfiles/vimrc

    autocmd! BufReadPost * if line("'\"") > 1 && line("'\"") <=
      \ line("$") | exe "normal! g'\"" | endif
    " autocmd BufEnter * silent! lcd %:p:h
    " au FocusLost * :silent! wall
    au FocusLost * :wall
    " Resize splits when the window is resized
    au VimResized * :wincmd =
    " autocmd vimenter * if !argc() | NERDTree | endif
    autocmd Filetype gitcommit setlocal textwidth=72
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

augroup genericSlimux
  if exists(':SlimuxGlobalConfigure')
    nnoremap <leader>sc :SlimuxGlobalConfigure<CR>
    nnoremap <space> :SlimuxREPLSendLine<CR> <bar> j
    vnoremap <space> :SlimuxREPLSendSelection<CR> <bar> \
      SlimuxSendKeys ' ' <CR>
    nnoremap <Leader>ll :SlimuxREPLSendLine<CR>
    nnoremap <Leader>aa :SlimuxREPLSendBuffer<CR>
    nnoremap <Leader>pp :SlimuxREPLSendParagraph<CR>
  endif
augroup end


let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="
let g:netrw_keepdir = 0

" follow symlinked file
function! FollowSymlink()
  let current_file = expand('%:p')
  " check if file type is a symlink
  if getftype(current_file) == 'link'
    " if it is a symlink resolve to the actual file path
    "   and open the actual file
    let actual_file = resolve(current_file)
    silent! execute 'file ' . actual_file
  end
endfunction

" set working directory to git project root
" or directory of current file if not git project
function! SetProjectRoot()
  " default to the current file's directory
  lcd %:p:h
  let git_dir = system("git rev-parse --show-toplevel")
  " See if the command output starts with 'fatal' (if it does, not in a git
  " repo)
  let is_not_git_dir = matchstr(git_dir, '^fatal:.*')
  " if git project, change local directory to git project root
  if empty(is_not_git_dir)
    " echo 'changing directory to top level of git directory'
    lcd `=git_dir`
  endif
endfunction
nnoremap <silent> <leader>pr :call SetProjectRoot()<CR>

" Abbreviations {{{
iabbrev THe The
iabbrev cc3 CompuCell3D
iabbrev arrow -->
" }}}

" Local config
let g:localvimrc = fnamemodify('.vimrc.local', ':p')
" call SetProjectRoot()
if filereadable(g:localvimrc)
  execute "source" . g:localvimrc
endif
source ~/antigenic_space/.vimrc.local

nnoremap <leader>per :e ~/antigenic_space/libs/fasanalysis/R
nnoremap <leader>pef :e ~/antigenic_space/libs/FirehoseDownload/R
nnoremap <leader>pem :e ~/antigenic_space/maarten-analyses
" DoMatchParen
