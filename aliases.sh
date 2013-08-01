alias ltr='ls -ltr'
alias ealias='vim $HOME/dotfiles/aliases.sh'
alias x='chmod +x'
alias geeknote='python $HOME/bin/geeknote/geeknote.py'
# alias todo='$HOME/Dropbox/todo/`date +%d%m%y`.md'
# alias ytodo='$HOME/Dropbox/todo/`date +%d%m%y --date="yesterday"`.md'
# alias gtodo='geeknote create --notebook todo --title `date +%d%m%y` --content "WRITE"'
# alias etodo='geeknote edit --notebook todo --title `date +%d%m%y`'
alias todo='geeknote edit --notebook todo --note gtd --content "WRITE"'
alias bi='vim +BundleClean! +BundleInstall +qall'
alias vcell='javaws $HOME/bin/vcell.jnlp'
alias ff='find . -name'

alias -s md=vim
alias -s tex=vim
alias -s com=chromium-browser
alias zz="sudo pm-suspend"

# alias tmux="TERM=screen-256color-bce tmux"
