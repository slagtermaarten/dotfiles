dir=~/dotfiles
olddir=~/dotfiles_old
dotfiles="tmux.conf xprofile ackrc ycm_extra_conf.py inputrc ctags Rprofile matplotlibrc gitignore gitconfig vimrc vim gvimrc zshrc zshenv oh-my-zsh vim-spell-en.utf-8.add"

# install homebrew and packages
cd $dir
if [[ $(uname) -eq Darwin ]]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  for i in `cat my_brews`; do
    brew install $i;
  done;
fi

cd $dir
git submodule init
git submodule update
git pull --recurse-submodules

# WARNING removing old versions of files
for file in $dotfiles; do
    [[ -e ~/.$file ]] && rm -rf ~/.$file
    echo "Creating symlink to dotfiles/$file in home directory."
    ln -s $dir/$file ~/.$file
done

mkdir -p ~/.vim/bundle/
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginClean +PluginInstall +qall

ln -s ~/dotfiles/powerline-fonts ~/.fonts
ln -s ~/dotfiles/bin ~/bin/

mkdir -p ~/Trash/

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

cd $dir

defaults write org.R-project.R force.LANG en_US.UTF-8
