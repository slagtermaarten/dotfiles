#!/bin/bash

dot=$(realpath /home/azureuser/cloudfiles/code/Users/Maarten.Slagter/azure_dotfiles)

"${dot}/install_scripts/config_fileshare.sh"

rm $HOME/.bashrc 2>/dev/null
ln -s "$(realpath ${dot}/bashrc)" "$HOME/.bashrc"

if [ ! -f $HOME/.bashrc ]; then
	echo "ERROR: $HOME/.bashrc does not exist after symlink attempt."
fi

rm $HOME/.ssh 2>/dev/null
ln -s "$(realpath /mnt/ms-data/config/my_key)" $HOME/.ssh
rm $HOME/.tmux.conf 2>/dev/null
ln -s "$(realpath ${dot}/tmux.conf)" $HOME/.tmux.conf
rm $HOME/.config 2>/dev/null
ln -s "$(realpath ${dot}/config)" $HOME/.config

sudo apt-get update && sudo apt-get install -y dialog tree git ripgrep seqtk pipx

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

if [ ! -d ~/bin ]; then
	ln -s ${dot}/bin $HOME
fi

git config --global user.email "maarten.slagter@curevac.com"
git config --global user.name "Maarten Slagter"

sudo sed -i '/^readonly TMOUT=900 ; export TMOUT/ s/^/#/' /etc/bash.bashrc

# Install NVM and latest Node.js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
sudo npm install n -g && n latest

# Install Taskfile
curl -1sLf 'https://dl.cloudsmith.io/public/task/task/setup.deb.sh' | sudo -E bash
sudo apt install task

"${dot}/install_scripts/install_nvim.sh"
"${dot}/install_scripts/install_nextflow.sh"

# Install Azure CLI, latest version
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
