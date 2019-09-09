#!/bin/zsh

ddir=$(pwd)
olddir="$(pwd)_old"
dotfiles=(tmux.conf tmux xprofile ackrc ycm_extra_conf.py inputrc ctags Rprofile 
          matplotlibrc gitignore gitconfig vimrc vim gvimrc zshrc zshenv 
          condarc oh-my-zsh vim-spell-en.utf-8.add)

rm -rf ~/.fonts
ln -s ~/$ddir/powerline-fonts ~/.fonts
rm -rf ~/bin
ln -s ~/$ddir/bin ~/bin

# install homebrew and packages
cd $ddir
if [[ $(uname) == "Darwin" ]]; then
  if ! type "brew" > /dev/null; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
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

mkdir -p ~/.config/nvim

## Neo-vim config file
mkdir -p ~/.config/nvim
# mkdir -p ~/.local/share/nvim/site
ln -s $ddir/vimrc ~/.config/nvim/init.vim
ln -s ~/.local/share/nvim/site ~/.vim 

# curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# vim +PluginClean +PluginInstall +qall
 
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PluginClean +PluginInstall +qall

mkdir -p ~/Trash/

# Install development tools and CMake:
# sudo apt-get install build-essential cmake
# Make sure you have Python headers installed:
# sudo apt-get install python-dev python3-dev
ycm_path=~/.vim/plugged/YouCompleteMe
if [[ -d $ycm_path ]]; then
  cd $ycm_path
  ./install.py --clang-completer
fi

cd $ddir

if [[ ! -d ~/conda ]]; then
  if [[ $(uname) == "Linux" ]]; then
    cd ~/
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    chmod +x Miniconda3-latest-Linux-x86_64.sh
    ./Miniconda3-latest-Linux-x86_64.sh
  fi

  if [[ $(uname) == "Darwin" ]]; then
    cd ~/
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
    chmod +x Miniconda3-latest-Linux-x86_64.sh
    ./Miniconda3-latest-Linux-x86_64.sh
  fi
fi
