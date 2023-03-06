#!/bin/bash

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install git
brew install tig
brew install neovim
brew install tmux
brew install exa
brew install peco
brew install --cask amethyst
brew install --cask agenda
brew install --cask iterm2
brew install fish
brew install starship
brew install rustup
brew tap homebrew/cask-fonts && brew install --cask font-meslo-lg-nerd-font

# copy config
cp -R ~/dotfiles/.config $HOME
cp ~/dotfiles/.gitconfig $HOME

# tpm install
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm 

# rust install
rustup

# rustlings
curl -L https://raw.githubusercontent.com/rust-lang/rustlings/main/install.sh | bash

# change shell
echo $(which fish) | sudo tee -a /etc/shells && chsh -s $(which fish)
