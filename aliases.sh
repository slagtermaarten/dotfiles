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
alias bi='vim +PluginClean! +PluginInstall +qall'
alias ff='find . -name'
# alias ag='sudo apt-get install'

alias -s md=vim
alias -s tex=vim
alias -s com=firefox
alias pylab="ipython qtconsole --pylab"
alias pynb="ipython notebook --pylab"
alias vim='/usr/local/opt/vim/bin/vim'
alias ster='ssh m.slagter@steroid'

# Resolve symlink
rs () { cd `pwd -P` }
vi ()  { command gvim -p --remote-tab-silent "$@" || command gvim "$@"; }
vir () { command vim "$@" -S ~/dotfiles/bin/VimRSession.vim }
# viewpdf () { command evince "$@" & }
# updatepandoc() {
#   cabal update
#   cabal install pandoc pandoc-citeproc
# }

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
[[ -f $localaliases ]] && source $localaliases
