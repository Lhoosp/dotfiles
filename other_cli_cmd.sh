#!bin/bash

# get dotfiles
git clone git@github.com:Lhoosp/dotfiles.git

# cp config
cp ~/dotfiles/.config ~/

# tpm install
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm 

# rust install
rustup

# change shell
echo $(which fish) | sudo tee -a /etc/shells && chsh -s $(which fish)
