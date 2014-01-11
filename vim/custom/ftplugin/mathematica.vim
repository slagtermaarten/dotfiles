let g:mma_candy = 1 
let g:mma_highlight_option = "solarized"

command! Math w | !command cat "`pwd`/%" | math | grep -v "In\["

noremap <leader> w :call Math
