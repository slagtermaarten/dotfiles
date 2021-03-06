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

alias -s {yml,yaml,R,rmd,py,md,tex}=$EDITOR
setopt autocd autopushd pushdignoredups
alias d='dirs -v | head -10'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

# alias lt='ls -lhtr --color=auto'
alias ls='ls -F -G --color=auto'
alias lt='ls -lhtr --color=auto'
# alias ls='ls -tr'
# alias ls='ls --color=auto'
alias tlf='tail -f'
alias e="$EDITOR"
alias la='ls -lhtra'
alias ealias='vim $HOME/dotfiles/aliases.sh'
alias x='chmod +x'
# alias ctags="`brew --prefix`/bin/ctags"
# alias vim="/usr/local/bin/mvim vim"
# alias geeknote='python $HOME/bin/geeknote/geeknote.py'
# alias todo='$HOME/Dropbox/todo/`date +%d%m%y`.md'
# alias ytodo='$HOME/Dropbox/todo/`date +%d%m%y --date="yesterday"`.md'
# alias gtodo='geeknote create --notebook todo --title `date +%d%m%y` --content "WRITE"'
# alias etodo='geeknote edit --notebook todo --title `date +%d%m%y`'
# alias todo='geeknote edit --notebook todo --note gtd --content "WRITE"'
alias ff='find . -name'
# alias ag='sudo apt-get install'
alias pylab="ipython qtconsole --pylab"
alias pynb="ipython notebook --pylab"
alias vi='nvim'
alias awkt="awk -F'\t'"
alias rm="rm -i"
alias mv="mv -i"
alias ..="cd .."
## Git shortcuts
alias g="git"
## Git merge fix
alias ntmux="tmux new-session -c"
autoload -U zmv
alias mmv='noglob zmv -W'
alias xo='xdg-open'

if [[ -f $HOME/dotfiles/s_aliases.sh ]]; then
  source $HOME/dotfiles/s_aliases.sh
fi

vimpath=/usr/local/opt/vim/bin/vim
if [[ -f $vimpath ]]; then
  alias vim=$vimpath
fi

localaliases=(`pwd`/.aliases.local)
if [[ -f $localaliases ]]; then
  echo "Sourcing local aliases"
  source $localaliases
fi

gr () {
  cd $(git rev-parse --show-toplevel)
}

gfix () {
  git diff --name-only | uniq | xargs $EDITOR
}

# Resolve symlink
rs () { 
  cd `pwd -P` 
}

# vi ()  { command gvim -p --remote-tab-silent "$@" || command gvim "$@"; }
vir () { 
  command $EDITOR "$@" -S ~/dotfiles/bin/VimRSession.vim 
}

rwork () {
  ssh -X coley -t 'tmux attach'
}

get_pw () {
  security 2>&1 >/dev/null find-generic-password -ga $1 \
  |ruby -e 'print $1 if STDIN.gets =~ /^password: "(.*)"$/'
}

# viewpdf () { command evince "$@" & }
# updatepandoc() {
#   cabal update
#   cabal install pandoc pandoc-citeproc
# }
