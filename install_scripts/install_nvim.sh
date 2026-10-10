#!/bin/bash

# This script installs the latest version of Neovim on a Linux system

# url=https://github.com/neovim/neovim/releases/download/v0.11.4/nvim-linux-x86_64.appimage
# target_bin=$HOME/cloudfiles/code/Users/Maarten.Slagter/azure_dotfiles/bin
# cur_path=$(realpath .)

# curl -LO $url && \
  # ./nvim-linux-x86_64.appimage --appimage-extract && \
  # cd $target_bin && \
  # ln -s $cur_path/squashfs-root/usr/bin/nvim .

mkdir -p ~/bin
rm ~/bin/nvim
ln -s ~/dotfiles/squashfs-root/AppRun ~/bin/nvim
nvim -q
