set -o vi
alias n="nvim"
alias n="/home/maartens/dotfiles/squashfs-root/AppRun"


alias sgemini="gemini -m gemini-3-flash-preview --yolo"

pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$1:${PATH}"
		else
			  # echo "Could not add $1 to PATH"
    fi
}

pathadd "/home/maartens/bin"
pathadd "/home/maartens/dotfiles/bin"
pathadd "/home/maartens/lib/go/bin"

alias u="cd .."
alias u2="cd .. && cd .."
alias u3="cd .. && cd .. && cd .."
alias u4="cd .. && cd .. && cd .. && cd .."
alias t="task"
alias lt="ls -ltr"
alias g="git"

# view_csv() {
# 	column -t -s',' $1 | less -S
# }
cv() {
  if [[ -t 0 ]]; then
    column -t -s',' "$1"
  else
    column -t -s','
  fi | less -S
}
alias csvv="cv"

tsvv() {
  if [[ -t 0 ]]; then
    column -t -s'\t' "$1"
  else
    column -t -s'\t'
  fi | less -S
}

freq() {
  if [[ -t 0 ]]; then
    sort | uniq -c "$1"
  else
    sort | uniq -c
  fi | less -S
}

extract_column() {
	# Ignore all lines starting with #
	tmpfile=$(mktemp)
	grep -v '^#' $1 > $tmpfile

	# Extract one or more columns from a CSV or TSV file
	# The columns are specified by their header name in comma-separated format
	# (argument 2, e.g. "Name,Age")
	if head -1 $tmpfile | grep -q $'\t'; then
		delim=$'\t'
	else
		delim=','
	fi

	colnames=$(echo $2 | tr ',' '\n')
	# colnum=$(head -1 $1 | tr "$delim" '\n' | nl -v 0 | grep -w "$colname" | awk '{print $1}')
	colnums=""
	for colname in $colnames; do
		# Find the column number (0-based)
		colnum=$(head -1 $tmpfile | tr "$delim" '\n' | nl -v 0 | grep -w "$colname" | awk '{print $1}')
		if [ -z "$colnum" ]; then
			echo "Column $colname not found among columns $(head -1 $tmpfile)"
			return 1
		fi
		if [ -z "$colnums" ]; then
			colnums="$((colnum + 1))"
		else
			colnums="$colnums,$((colnum + 1))"
		fi
	done

	cut -f"$colnums" -d"$delim" $tmpfile
	rm $tmpfile
}
alias ec=extract_column

autoload -Uz compinit
compinit
source ~/dotfiles/bin/hyperjump

alias rp="realpath ."

git config --global --replace-all alias.au 'add -u'
git config --global --replace-all alias.fix 'commit --amend'
git config --global --replace-all alias.qfix 'commit --amend --no-edit'
git config --global --replace-all alias.co "checkout"
git config --global --replace-all alias.cob 'checkout -b'
git config --global --replace-all alias.br "branch"
git config --global --replace-all alias.c "commit"
git config --global --replace-all alias.cm 'commit -m'
git config --global --replace-all alias.s "status"
git config --global --replace-all alias.ds "diff --staged"
git config --global --replace-all alias.d "diff"
git config --global --replace-all alias.l "log"
git config --global --replace-all alias.rb "rebase"
git config --global --replace-all alias.rbc 'rebase --continue'
git config --global --replace-all alias.rbi 'rebase --interactive'
git config --global --replace-all alias.pf 'push --force'
git config --global --replace-all alias.lg "log --graph --decorate"
git config --global --replace-all alias.lga "log --oneline --graph --all --decorate"
git config --global --replace-all alias.rw "restore --worktree"
git config --global --replace-all alias.rs "restore --staged"


git config --global pager.status true
git config --global push.autoSetupRemote true
git config --global core.editor "vim"
# Add the files that were staged already
alias gas='git add $(git diff --name-only --cached)'
# Add the files that were altered in the last commit
alias gac='git add $(git show --name-only --pretty=format: HEAD)'
alias gqfix="git add -u && git commit --amend --no-edit"
alias gvcd="git config --global --add safe.directory ."
alias rc="n $HOME/.zshrc"


. "$HOME/.local/bin/env"

# Tmux window naming
function _tmux_rename_window() {
    if [[ -n "$TMUX" ]]; then
        local name
        name=$(~/dotfiles/bin/tmux-project-name "$PWD")
        tmux rename-window "$name"
    fi
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd _tmux_rename_window
add-zsh-hook chpwd _tmux_rename_window

# Show only the current directory basename in the prompt
PROMPT="%F{cyan}[%n@%m]%f %F{green}%1~%f ~ "
[ -f ~/dotfiles/.zshrc.local ] && source ~/dotfiles/.zshrc.local
