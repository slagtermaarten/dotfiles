ZSH=$HOME/.oh-my-zsh
ZSH_THEME="gozilla"
export EDITOR=vim

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
plugins=(git autojump)

source $ZSH/oh-my-zsh.sh
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

autoload zmv
autojump

# source ~/venv/*/activate

source ~/bin/tmuxinator.zsh

# PERL_MB_OPT="--install_base \"/Users/m.slagter/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/Users/m.slagter/perl5"; export PERL_MM_OPT;
