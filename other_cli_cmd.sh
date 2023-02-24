#!bin/bash

# tpm install
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm 

# change shell
echo $(which fish) | sudo tee -a /etc/shells && chsh -s $(which fish)
