#!/bin/bash

# Install NVM/Node

InstallNvm() {
  fancy_echo "Installing nvm..."
  if [[ $(id -u) -ne 0 ]]; then
    shw_err "sudo password required to ensure clean NVM installation:"
    sudo rm -rf ~/.nvm ~/.npm ~/.bower # Ensures fresh NVM install
  fi

  mkdir "$HOME/.nvm/"

  curl -s -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
}

InstallNodeLatest() {
  source ~/.nvm/nvm.sh
  fancy_echo "Installing Node..."
  nvm install node &> /dev/null
}