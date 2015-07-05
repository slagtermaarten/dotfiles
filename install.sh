#!/bin/zsh

dir=~/dotfiles
dotfiles=(tmux.conf xprofile ackrc ycm_extra_conf.py inputrc ctags Rprofile matplotlibrc gitignore gitconfig vimrc vim gvimrc zshrc zshenv oh-my-zsh awesome)

cd $dir
git submodule init
git submodule update
git pull --recurse-submodules

# WARNING removing old versions of files
for file in $dotfiles; do
    [[ -a ~/.$file ]] && rm -rf ~/.$file
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

mkdir -p ~/.vim/bundle/
[[ ! -d ~/.vim/bundle/Vundle.vim ]] && \
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginClean +PluginInstall +qall

echo "Creating symlink to powerline-fonts in home directory."
[[ ! -a ~/.fonts ]] && ln -s dotfiles/powerline-fonts ~/.fonts
echo "Creating symlink to dotfiles/bin in home directory."
[[ ! -d ~/bin ]] && ln -s dotfiles/bin ~/bin/
