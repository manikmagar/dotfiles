#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if hash brew 2>/dev/null; then
  echo "Homebrew is already installed!"
else
  echo "Installing Homebrew..."
  yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo
echo "Ensuring you have the latest Homebrew..."
brew update

echo
echo "Upgrading existing brews..."
brew upgrade

echo "Cleaning up your Homebrew installation..."
brew cleanup

sh ./brew.sh

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/.p10k.zsh $HOME/.p10k.zsh
# Install theme - https://github.com/Powerlevel9k/powerlevel9k/wiki/Install-Instructions#option-2-install-for-oh-my-zsh
if [[ ! -d ~/.dotfiles/themes/powerlevel9k ]] ; then
  git clone https://github.com/Powerlevel9k/powerlevel9k.git ~/.dotfiles/themes/powerlevel9k
else 
  echo "~/.dotfiles/themes/powerlevel9k already exists"
fi
if [[ ! -d ~/.dotfiles/plugins/zsh-completions ]] ; then
  git clone https://github.com/zsh-users/zsh-completions ~/.dotfiles/plugins/zsh-completions
else 
  echo "~/.dotfiles/plugins/zsh-completions already exists"
fi

rm -rf $HOME/.mackup.cfg
# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

sh sdkman.sh

# Configure git delta
echo "[core]
    pager = delta --plus-color="#012800" --minus-color="#340001" --theme='Monokai Extended'

[interactive]
    diffFilter = delta --color-only" >> ~/.gitconfig

source $HOME/.zshrc

## Configure VScode
code --install-extension "redhat.java" 
code --install-extension "github.copilot"
code --install-extension "github.copilot-chat"
code --install-extension eamodio.gitlens
code --install-extension "vscjava.vscode-maven"
code --install-extension coenraads.bracket-pair-colorizer
