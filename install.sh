#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if hash brew 2>/dev/null; then
  echo "Homebrew is already installed!"
else
  echo "Installing Homebrew..."
  yes '' | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo
echo "Ensuring you have the latest Homebrew..."
brew update

echo
echo "Upgrading existing brews..."
brew upgrade

echo "Cleaning up your Homebrew installation..."
brew cleanup

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
# Install theme - https://github.com/Powerlevel9k/powerlevel9k/wiki/Install-Instructions#option-2-install-for-oh-my-zsh
git clone https://github.com/Powerlevel9k/powerlevel9k.git ~/.dotfiles/themes/powerlevel9k

rm -rf $HOME/.mackup.cfg
# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

if hash sdk 2>/dev/null; then
  echo "Sdkman is already installed!"
else
  echo "Installing Sdkman..."
  yes '' | sh sdkman.sh
fi

SOURCE $HOME/.zshrc

## Configure VScode
code --install-extension vscjava.vscode-java-pack 
code --install-extension joaompinto.asciidoctor-vscode
code --install-extension redhat.vscode-quarkus