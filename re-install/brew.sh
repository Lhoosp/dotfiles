#!/bin/bash

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# install formulaes
brew install git
#brew install tig # help with git
brew install neovim
#brew install tmux
brew install exa # faster alternative "ls"
#brew install tree # beautiful show files in directories
#brew install peco
brew install ack # faster alternative "grep"
#brew install fzf # fuzzy finder (cool thing)

brew install fish # get fish-shell
brew install starship # useful terminal suggestions
brew tap homebrew/cask-fonts && brew install --cask font-meslo-lg-nerd-font # meslo font

# install casks
brew install --cask iterm2
#brew install --cask vlc
#brew install --cask android-studio
#brew install --cask basictex # LaTex for Vim
