#!/bin/bash

# get dotfiles
git clone git@github.com:Lhoosp/dotfiles.git $HOME

# enable settings
cp -R ~/dotfiles/.config $HOME
cp ~/dotfiles/.gitconfig $HOME
cp ~/dotfiles/.gitignore $HOME

# tpm install
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# change hibernatemod
sudo pmset hibernatemode 0

# rust install
rustup-init

# rustlings install
curl -L https://raw.githubusercontent.com/rust-lang/rustlings/main/install.sh | bash

# change shell
echo $(which fish) | sudo tee -a /etc/shells && chsh -s $(which fish)
