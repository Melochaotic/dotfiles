#!/bin/zsh

# Install Homebrew if not already
brew -v || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install some brews
brew install \
    fzf \
    gcc \
    gh \
    lazygit\
    nvim \
    starship \
    stow \
    zellij \
    zoxide \
    ripgrep \
    fd \
    jq \
    mpv

# Install zsh plugins
git clone git@github.com:grigorii-zander/zsh-npm-scripts-autocomplete.git ~/.oh-my-zsh/custom/plugins/zsh-npm-scripts-autocomplete
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

if [[ "$OSTYPE" == "linux-gnu"* ]]; then # WSL/Linux only
    echo 'No custom linux setup'
elif [[ "$OSTYPE" == "darwin"* ]]; then # MacOS only
    brew install --cask alt-tab raycast
fi;

# Run stow
stow */ --adopt

# complete git setup
if [ ! -f ~/.user.gitconfig ]; then
    cp -n ~/.user.gitconfig.example ~/.user.gitconfig && nvim ~/.user.gitconfig
fi

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
source ~/.zshrc
# nvm install --lts && nvm alias default lts/*
nvm install 24 && nvm alias default 24

npm install -g pnpm@latest-10
