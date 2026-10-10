#!/bin/bash

export HOME=/home/azureuser
cd $HOME
bin_dir=/home/azureuser/cloudfiles/code/Users/Maarten.Slagter/azure_dotfiles/bin

# Test
#
# This command is supposed to check if java is installed via sdkman and points to the correct location.
# However, the syntax is incorrect and will always evaluate to true, leading to java being installed
# every time the script is run.
# # Corrected version:
if [ "$(readlink -f "$(command -v java)")" != "/home/azureuser/.sdkman/candidates/java/17.0.10-tem/bin/java" ]; then
# if ! command -v java = "/home/azureuser/.sdkman/candidates/java/current/bin/java"; then
# 	echo "java not found or incorrect version, installing java via sdkman"

	# Install java
	curl -s https://get.sdkman.io | bash
	# Restart shell to load sdkman
	source "$HOME/.sdkman/bin/sdkman-init.sh"
	sdk install java 17.0.10-tem

	# Symlink the sdkman java installation to the default java location /usr/lib/java
	sudo rm /usr/bin/java
	cd /usr/bin && sudo ln -s "$HOME/.sdkman/candidates/java/current/bin/java" .
else
	echo "java is already installed and points to the correct location"
fi

# Install Nextflow
if ! command -v nextflow > /dev/null 2>&1 && [ ! -f $bin_dir/nextflow ]; then
	export CAPSULE_LOG=none
	sudo curl -s https://get.nextflow.io | bash
	# wget https://www.nextflow.io/releases/v25.10.0/nextflow?a=install
	chmod +x nextflow

	nf_loc=$bin_dir/nextflow
	if [[ -f  $nf_loc ]]; then
			sudo rm $nf_loc
	fi
	sudo mv ./nextflow $bin_dir
else
	echo "Nextflow is already installed"
fi

# Install nf-test
if ! command -v nf-test > /dev/null 2>&1 && [ ! -f $bin_dir/nf-test ]; then
	wget -qO- https://get.nf-test.com | bash
	mv nf-test $bin_dir
else
	echo "nf-test is already installed"
fi

# Install Node Version Manager (NVM)
if ! command -v nvm > /dev/null 2>&1 && [ ! -d $HOME/.nvm ]; then
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
else
	echo "nvm is already installed"
fi

