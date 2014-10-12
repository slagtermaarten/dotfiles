cd ~/dotfiles
git pull --recurse-submodules

cd $HOME
ln -s dotfiles/bin .
ln -s dotfiles/vim .vim
ln -s dotfiles/vimrc .vimrc
ln -s dotfiles/gvimrc .gvimrc
ln -s dotfiles/zshrc .zshrc
ln -s dotfiles/zshenv .zshenv
ln -s dotfiles/matplotlibrc .matplotlibrc
ln -s dotfiles/tmux.conf .tmux.conf
ln -s dotfiles/gitignore .gitignore
ln -s dotfiles/gitconfig .gitconfig
ln -s dotfiles/powerline-fonts .fonts
ln -s dotfiles/Rprofile .Rprofile
ln -s dotfiles/ackrc .ackrc
ln -s dotfiles/ctags .ctags
ln -s dotfiles/inputrc .inputrc
ln -s dotfiles/ycm_extra_conf.py .ycm_extra_conf.py

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleClean +BundleInstall +qall
