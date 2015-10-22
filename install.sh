dir=~/dotfiles
olddir=~/dotfiles_old
dotfiles="tmux.conf xprofile ackrc ycm_extra_conf.py inputrc ctags Rprofile matplotlibrc gitignore gitconfig vimrc vim gvimrc zshrc zshenv oh-my-zsh"

cd $dir
git submodule init
git submodule update
git pull --recurse-submodules

# WARNING removing old versions of files
for file in $dotfiles; do
    [[ -e ~/.$file ]] && rm -rf ~/.$file
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

mkdir -p ~/.vim/bundle/
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleClean +BundleInstall +qall

ln -s dotfiles/powerline-fonts ~/.fonts
ln -s dotfiles/bin ~/bin/

mkdir -p ~/Trash/

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# install packages
if [[ $(uname) -eq Darwin]]; then
  for i in `cat my_brews`; do
    brew install $i;
  done;
