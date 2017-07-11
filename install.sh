#!/bin/zsh

ddir=~/dotfiles
olddir=~/dotfiles_old
dotfiles=(tmux.conf tmux xprofile ackrc ycm_extra_conf.py inputrc ctags Rprofile 
          matplotlibrc gitignore gitconfig vimrc vim gvimrc zshrc zshenv 
          oh-my-zsh vim-spell-en.utf-8.add)

rm -f ~/.fonts
ln -s ~/$ddir/powerline-fonts ~/.fonts
rm -f ~/bin
ln -s ~/$ddir/bin ~/bin

# install homebrew and packages
cd $ddir
if [[ $(uname) == "Darwin" ]]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  for i in `cat my_brews`; do
    brew install $i;
  done;
  defaults write org.R-project.R force.LANG en_US.UTF-8
fi

cd $ddir
git submodule init
git submodule update
git pull --recurse-submodules

# WARNING removing pre-existing versions of files
for file in $dotfiles; do
  [[ -e ~/.$file ]] && rm -rf ~/.$file
  echo "Creating symlink to $file in home directory."
  ln -s $ddir/${file} ~/.$file
done

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# mkdir -p ~/.vim/bundle/
# vim +PluginClean +PluginInstall +qall

mkdir -p ~/Trash/

ycm_path=~/.vim/bundle/YouCompleteMe
if [[ -d $ycm_path ]]; then
  cd $ycm_path
  ./install.py --clang-completer
fi

cd $ddir


