mergepdf () {
  outputfile=shift
  gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=$outputfile $@
}

# compareTex(fn) {
#   latexdiff <(git show HEAD:$fn) $fn > tmp.tex
#   pdflatex -interaction=nonstopmode tmp.tex
# }
# alias tmux="TERM=screen-256color-bce tmux"
# File name aliases
# alias -s pdf=evince
# alias -s py=vi
# alias -s sh=vi
