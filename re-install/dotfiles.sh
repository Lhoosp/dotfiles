#!/bin/bash

git clone git@github.com:Lhoosp/dotfiles.git $HOME/dotfiles

# settings
cp -R ~/dotfiles/.config $HOME
cp ~/dotfiles/.gitconfig $HOME
cp ~/dotfiles/.gitignore $HOME
