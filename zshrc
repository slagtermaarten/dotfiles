autoload -U edit-command-line
bindkey -M vicmd v edit-command-line

HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY
export SAVEHIST=1000

# ZSH=$HOME/.oh-my-zsh
# ZSH_THEME="gozilla"

setopt interactivecomments
setopt extended_glob

# eval `dircolors ~/dotfiles/dircolors-solarized/dircolors.ansi-light`
# eval `dircolors ~/dotfiles/dircolors-solarized`
# export CLICOLOR=yes

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git vim)

# source $ZSH/oh-my-zsh.sh
source $HOME/dotfiles/aliases.sh

## Vim mode
bindkey -v
## Set timeout to .1 sec
export KEYTIMEOUT=1

# function zle-line-init zle-keymap-select {
# 	VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
# 	RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
# 	zle reset-prompt
# }
# zle -N zle-line-init
# zle -N zle-keymap-select

autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line


# if [ -e /usr/share/terminfo/x/xterm-256color ]; then
#     export TERM='xterm-256color'
# else
#     export TERM='xterm-color'
# fi

function chpwd() {
    emulate -L zsh
    ls -tr
    if [[ -f .zshenv.local ]] && source .zshenv.local
}

# function rm() {
#     local go_ahead
#     read -q "go_ahead?Are you sure you don't want to use trash-put? [y/N]"
#     echo ""
#     if [[ "$go_ahead" = "y" ]]; then
#         /bin/rm $*
#     else
#         /usr/bin/env trash-put $*
#     fi
# }

# autoload zmv
# autojump
#

set -k
# source ~/venv/*/activate

# Custom prompt without bloat from oh-my-zsh (see here for opts
# http://www.nparikh.org/unix/prompt.php#zsh)
if [[ -n $SSH_CONNECTION ]]; then
  PROMPT="[%B%m%b]%F{green}%t - %F{blue}%2/%_%f ~ "
else
  PROMPT="%t - %F{blue}%2/%_%f ~ "
fi

autoload -U compinit && compinit

[[ -f ~/bin/tmuxinator.zsh ]] && source ~/bin/tmuxinator.zsh

# To save every command before it is executed
# setopt inc_append_history
# To retrieve the history file everytime history is called upon.
# setopt share_history

eval "$(fasd --init auto)"

[[ -f .zshenv.local ]] && source .zshenv.local

export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:'

