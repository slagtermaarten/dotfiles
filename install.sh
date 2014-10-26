dir=~/dotfiles
olddir=~/dotfiles_old
dotfiles="tmux.conf xprofile ackrc ycm_extra_conf.py inputrc ctags Rprofile matplotlibrc gitignore gitconfig vimrc vim gvimrc zshrc zshenv oh-my-zsh"

cd $dir
git pull --recurse-submodules

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
echo "Moving any existing dotfiles from ~ to $olddir ... "
for file in $files; do
    [[ -e ~/.$file ]] && mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleClean +BundleInstall +qall

ln -s dotfiles/powerline-fonts ~/.fonts
ln -s dotfiles/bin ~/bin
