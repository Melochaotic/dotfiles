#!/bin/bash

# TODO: Install zsh & oh-my-zsh based on platform


# Install Homebrew if not already
brew -v || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install some brews
brew install stow fzf zoxide gh nvim starship zellij gcc jesseduffield/lazygit/lazygit

# Install zsh plugins
git clone git@github.com:grigorii-zander/zsh-npm-scripts-autocomplete.git ~/.oh-my-zsh/custom/plugins/zsh-npm-scripts-autocomplete
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Run stow
stow */ --adopt

# complete git setup
if [ ! -f ~/.user.gitconfig ]; then
    cp -n ~/.user.gitconfig.example ~/.user.gitconfig && nvim ~/.user.gitconfig
fi