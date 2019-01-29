#!/bin/bash

# Install Xcode Tools or redirect error if already installed
xcode-select --install 2>/dev/null


# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  say "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

brew bundle --quiet --file = "../Brewfile.base" &>/dev/null