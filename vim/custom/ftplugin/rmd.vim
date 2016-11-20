source ~/dotfiles/vim/custom/ftplugin/r.vim

setlocal linebreak
setlocal textwidth=80
setlocal commentstring=#%s
set nospell

nnoremap <silent> <buffer> <LocalLeader>rr :call g:SendCmdToR('rmarkdown::render("'
 \ . expand("%:t") . '", intermediates_dir = "knitr_intermed",
 \ output_dir = "knitr_output")') <CR>
