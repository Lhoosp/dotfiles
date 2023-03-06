#!/bin/bash

# get dotfiles
git clone git@github.com:Lhoosp/dotfiles.git

# enable settings
cp -R ~/dotfiles/.config $HOME
cp ~/dotfiles/.gitconfig $HOME

# tpm install
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
