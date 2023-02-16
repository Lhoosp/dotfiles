brew install git tig neovim tmux exa figma appcleaner fish starship rustup 

brew tap homebrew/cask-fonts
brew search '/font-.*-nerd-font/' | awk '{ print $1 }' | xargs brew install --cask
