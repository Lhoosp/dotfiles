#!/bin/bash

# install skhd & yabai
brew install koekeishiya/formulae/skhd
brew install koekeishiya/formulae/yabai

# enable skhd, yabai
yabai --start-service 
skhd --start-service 
