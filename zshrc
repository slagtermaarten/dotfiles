# ZSH=$HOME/.oh-my-zsh
# ZSH_THEME="gozilla"

# setopt extended_blob

# eval `dircolors ~/dotfiles/dircolors-solarized/dircolors.ansi-light`
# eval `dircolors ~/dotfiles/dircolors-solarized`

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

bindkey -v

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi

function chpwd() {
    emulate -L zsh
    ls -tr
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
PROMPT="%B%2/%b%_ ~ "
