headless_browser() {
  URL=${1}
  echo $URL
  if [ "$(uname)" = 'Darwin' ]; then
    /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --app=$URL
  else
    ## Assume platform is Linux
    google-chrome --app=$URL
  fi
}

alias lt='ls -lhtr'
alias tlf='tail -f'
alias e='$EDITOR'
alias la='ls -lhtra'
alias ealias='vim $HOME/dotfiles/aliases.sh'
alias x='chmod +x'
# alias geeknote='python $HOME/bin/geeknote/geeknote.py'
# alias todo='$HOME/Dropbox/todo/`date +%d%m%y`.md'
# alias ytodo='$HOME/Dropbox/todo/`date +%d%m%y --date="yesterday"`.md'
# alias gtodo='geeknote create --notebook todo --title `date +%d%m%y` --content "WRITE"'
# alias etodo='geeknote edit --notebook todo --title `date +%d%m%y`'
# alias todo='geeknote edit --notebook todo --note gtd --content "WRITE"'
alias bi='$EDITOR +PluginClean! +PluginInstall +qall'
alias ff='find . -name'
# alias ag='sudo apt-get install'
alias -s md=$EDITOR
alias -s tex=$EDITOR
alias pylab="ipython qtconsole --pylab"
alias pynb="ipython notebook --pylab"
alias vim='/usr/local/opt/vim/bin/vim'
alias vi='nvim'
alias ster='ssh m.slagter@steroid'
alias para='ssh m.slagter@paranoid'
alias med='ssh m.slagter@medoid'
alias void='ssh m.slagter@void'
alias awkt="awk -F'\t'"
alias ..="cd .."
alias g="git"
alias grf="git diff -name-only | uniq | xargs $EDITOR"

alias rvoid='headless_browser "http://void:8787"'
alias rmed='headless_browser "http://medoid:8787"'
alias rpara='headless_browser "http://paranoid:8787"'
alias rster='headless_browser "http://ster:8787"'


# Resolve symlink
rs () { cd `pwd -P` }
# vi ()  { command gvim -p --remote-tab-silent "$@" || command gvim "$@"; }
vir () { command vim "$@" -S ~/dotfiles/bin/VimRSession.vim }
# viewpdf () { command evince "$@" & }
# updatepandoc() {
#   cabal update
#   cabal install pandoc pandoc-citeproc
# }


mergepdf () {
  outputfile=shift
  gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=$outputfile $@
}


autoload -U zmv
alias mmv='noglob zmv -W'

# compareTex(fn) {
#   latexdiff <(git show HEAD:$fn) $fn > tmp.tex
#   pdflatex -interaction=nonstopmode tmp.tex
# }
# alias tmux="TERM=screen-256color-bce tmux"
# File name aliases
# alias -s pdf=evince
# alias -s py=vi
# alias -s sh=vi

localaliases=(`pwd`/.aliases.local)
if [[ -f $localaliases ]]; then
  echo "Sourcing local aliases"
  source $localaliases
fi

rs() {
  rsync -avz "m.slagter@paranoid:${1}" "${2}"
}

gr() {
  cd $(git rev-parse --show-toplevel)
}

