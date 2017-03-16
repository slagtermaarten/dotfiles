source ~/dotfiles/vim/custom/ftplugin/r.vim

setlocal linebreak
setlocal textwidth=80
setlocal commentstring=#%s
set nospell

nnoremap <silent> <buffer> <LocalLeader>rr :call g:SendCmdToR('rmarkdown::render("'
 \ . expand("%:p:t") . '", intermediates_dir = "~/antigenic_space/maarten-analyses/knitr_intermed",
 \ output_dir = "~/antigenic_space/maarten-analyses/knitr_output")') <CR>
