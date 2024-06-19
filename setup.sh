#! /bin/bash

# Install zsh
zsh --version &> /dev/null || {
    echo "zsh is not installed. Installing zsh..."
    brew install zsh
    chsh -s /opt/homebrew/bin/zsh
}

# Install Oh My Zsh
curl --version &> /dev/null || {
    echo "curl is not installed. Installing curl..."
    brew install curl
}

git --version &> /dev/null || {
    echo "git is not installed. Installing git..."
    brew install git
}

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install neofetch
neofetch --version &> /dev/null || {
    echo "neofetch is not installed. Installing neofetch..."
    brew install neofetch
}

# Install eza
eza --version &> /dev/null || {
    echo "eza is not installed. Installing eza..."
    brew install eza
}

# Install kitty
kitty --version &> /dev/null || {
    echo "kitty is not installed. Installing kitty..."
    brew install --cask kitty
}

# Install nvim
nvim --version &> /dev/null || {
    echo "nvim is not installed. Installing nvim..."
    brew install neovim
}

# Link the zshrc file
mv $HOME/.zshrc $HOME/.zshrc.backup
ln -s ./zsh/.zshrc $HOME/.zshrc

# Install all the omz plugins
# 1. zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# 2. zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# 3. fzf-tab
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
# 4. zsh-fzf-history-search
git clone https://github.com/joshskidmore/zsh-fzf-history-search ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-fzf-history-search

# Add steeef theme customised for my use
ln -s ./zsh/steeef.zsh-theme $HOME/.oh-my-zsh/themes/steeef.zsh-theme

# Install neovide
neovide --version &> /dev/null || {
    echo "neovide is not installed. Installing neovide..."
    brew install --cask neovide
}

# Install ranger
ranger --version &> /dev/null || {
    echo "ranger is not installed. Installing ranger..."
    brew install ranger
}

# Install loop
loop --version &> /dev/null || {
    echo "loop is not installed. Installing loop..."
    brew install --cask loop
}
# NOTE: remember to import the keybindings from the loop directory in the loop application after installing.


# Also, install karabiner-elements and import the keybindings from the karabiner directory in the karabiner-elements application after installing.
# https://github.com/pqrs-org/Karabiner-Elements/releases/download/v14.13.0/Karabiner-Elements-14.13.0.dmg

# Raycast isn't available on brew, so we'll have to install it manually. The configs are not added in this repo as it exposes a lot of secret tokens, hence is backed up in my private cloud storage.

