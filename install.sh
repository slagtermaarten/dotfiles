cd ~/dotfiles
git pull --recurse-submodules

cd $HOME
ln -s /vim .vim
ln -s dotfiles/vimrc .vimrc
ln -s dotfiles/zshrc .zshrc
ln -s dotfiles/zshenv .zshenv
ln -s dotfiles/matplotlibrc .matplotlibrc
ln -s dotfiles/tmux.conf .tmux.conf
ln -s dotfiles/gitignore .gitignore
ln -s dotfiles/gitignore .gitconfig
ln -s dotfiles/powerline-fonts .fonts

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleClean +BundleInstall +qall