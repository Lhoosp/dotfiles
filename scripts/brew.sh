#!/bin/bash

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# install formules
brew install git
brew install tig
brew install neovim
brew install tmux
brew install exa
brew install peco
brew install fish
brew install starship
brew install rustup
brew install --cask iterm2
brew install --cask vlc
brew tap homebrew/cask-fonts && brew install --cask font-meslo-lg-nerd-font
brew install koekeishiya/formulae/skhd
brew install koekeishiya/formulae/yabai
