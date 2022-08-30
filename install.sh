#!/bin/bash

# Dependencies
echo "Installing dependencies.."
sudo apt-get install -y git curl

# Chrome
CHROME_PATH=$(which /opt/google/chrome/chrome)
if [ "${CHROME_PATH}" == "" ]; then
  echo "Installing chrome..."
  curl -s -o /tmp/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb
fi

# ASDF
if [ ! -d "${HOME}/.asdf" ]; then
    echo "Installing asdf..."
    git clone https://github.com/asdf-vm/asdf.git ${HOME}/.asdf
fi

# Get plugins
curl -L https://raw.githubusercontent.com/exzeo/linux-install/main/scripts/install-asdf-plugins.sh | bash

# Get tools versions
curl -s -o ${HOME}/.tool-versions https://raw.githubusercontent.com/exzeo/linux-install/main/files/.tool-versions
${HOME}/.asdf/bin/asdf install