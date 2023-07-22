#!/bin/bash

# packer_nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
 
# tpm (tmux plugin manager)
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
