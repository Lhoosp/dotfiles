#!bin/bash

# tpm install
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm #in

# change shell
echo $(which fish) | sudo tee -a /etc/shells && sudo chsh -s $(which fish)
