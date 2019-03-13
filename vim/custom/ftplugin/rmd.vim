source ~/dotfiles/vim/custom/ftplugin/r.vim

filetype plugin indent on
setlocal linebreak
set nospell
" call tcomment#DefineType('r')

nnoremap <silent> <buffer> <LocalLeader>rr :call g:SendCmdToR('rmarkdown::render("'
 \ . expand("%:p") . '", intermediates_dir = "~/antigenic_space/maarten-analyses/knitr_intermed",
 \ output_dir = "~/antigenic_space/maarten-analyses/knitr_output")') <CR>
