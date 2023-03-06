#!/bin/bash
echo "The main script"

installpath = $HOME/dotfiles/install_scripts

source $installpath/get_new_ssh.sh
source $installpath/brew.sh
source $installpath/get_config.sh
source $installpath/rust.sh
source $installpath/change_shell.sh
