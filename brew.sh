#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg



# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install other useful binaries.
brew install ack
brew install git
brew install git-lfs
brew install gs
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli


brew install 'bat' # "cat" on steroids
brew install 'grep'
brew install 'httpie'
brew install 'ack' # Search tool like grep, but optimized for programmers
brew install 'autojump' # Jump to directories quickly
brew install 'bat-extras' # Extra syntax highlighting themes for bat
brew install 'curl' # Command line tool for transferring data with URLs
brew install 'fd' # Simple, fast and user-friendly alternative to find

brew install 'jq'
brew install 'mas' # Mac App Store manager
brew install 'tree' # List directories in a tree structure
brew install 'vim'
brew install 'zlib' # Needed for Memcached
brew install 'zsh-syntax-highlighting'
brew install 'zsh-autosuggestions'
brew install 'z'
 # Configure gpg: Start
brew install 'gnupg' 
brew install 'pinentry-mac'
# Configure gpg: End
# https://develotters.com/posts/terminal-fun-basic-utils/
brew install 'exa'
#brew install 'git-delta'
# Remove outdated versions from the cellar.

brew cleanup
