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

