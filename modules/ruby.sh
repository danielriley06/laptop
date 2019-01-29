#!/bin/bash

InstallRbenv() {
  if command -v brew > /dev/null 2>&1; then
    say "Bootstraping dependencies for Ruby..."
    brew install rbenv ruby-build rbenv-default-gems rbenv-gemset
    fancy_echo "Validating rbenv install..."
    curl --silent --show-error https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash &>/dev/null
  else
    error "FATAL: Homebrew failed to install... please re-run the script!"
    exit 1
  fi
}

InstallRubyLatest() {
  if type rbenv > /dev/null; then
    say "Installing latest Ruby release (v$(rbenv install -l | grep -v - | tail -1))..."
    rbenv install $(rbenv install -l | grep -v - | tail -1) &>/dev/null
    ret_code=$?
    rbenv global $(rbenv install -l | grep -v - | tail -1)
    rbenv rehash

    say "Configuring bundler globally..."
    number_of_cores=$(sysctl -n hw.ncpu)
    bundle config --global jobs $((number_of_cores - 1))
  else
    error "rbenv command not found!"
  fi
}

GenerateGemrc() {
  if [ -f "$HOME/.gemrc" ]; then
    cp gemrc ~/.gemrc
  else
    touch "$HOME/.gemrc"
    echo 'gem: --no-document' >> ~/.gemrc
  fi
}

InstallDefaultGemDependencies() {
  echo 'bundler\nrails' >> "$(brew --prefix rbenv)/default-gems"
}