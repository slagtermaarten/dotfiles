setlocal linebreak
setlocal textwidth=90
setlocal commentstring=#%s

nnoremap <silent> <buffer> <LocalLeader>rr :call g:SendCmdToR('rmarkdown::render("'
 \ . expand("%:t") . '", intermediates_dir = "knitr_intermed",
 \ output_dir = "knitr_output")') <CR>

iabbrev < <-

source ~/dotfiles/vim/custom/ftplugin/r.vim
