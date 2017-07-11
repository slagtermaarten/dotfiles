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
alias ls='ls -tr'
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
vimpath=/usr/local/opt/vim/bin/vim
if [[ -f $vimpath ]]; then
  alias vim=$vimpath
fi
alias vi='nvim'
alias awkt="awk -F'\t'"
alias ..="cd .."
## Git shortcuts
alias g="git"
## Git  merge fix
alias gfix="git diff --name-only | uniq | xargs $EDITOR"
alias ntmux="tmux new-session -c"

alias ster='ssh -X m.slagter@steroid'
alias para='ssh -X m.slagter@paranoid'
alias med='ssh -X m.slagter@medoid'
alias void='ssh -X m.slagter@void'
alias coley='ssh -X m.slagter@coley'
alias gateway='ssh -X m.slagter@rhpc.nki.nl'
alias rster='headless_browser "http://ster:8787"'
alias rpara='headless_browser "http://paranoid:8787"'
alias rmed='headless_browser "http://medoid:8787"'
alias rvoid='headless_browser "http://void:8787"'


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
