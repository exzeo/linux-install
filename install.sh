#!/bin/bash

# Dependencies
echo "Installing dependencies.."
sudo apt-get install -y git curl wget gpg apt-transport-https

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
curl -s -L https://raw.githubusercontent.com/exzeo/linux-install/main/scripts/install-asdf-plugins.sh | bash

# Get tools versions
curl -s -o ${HOME}/.tool-versions https://raw.githubusercontent.com/exzeo/linux-install/main/files/.tool-versions
${HOME}/.asdf/bin/asdf install

# VS Code
VSCODE_PATH=$(which /usr/bin/code)
if [ "${VSCODE_PATH}" == "" ]; then
  echo "Installing VS Code..."
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
  sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
  sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
  rm -f packages.microsoft.gpg
  sudo apt update
  sudo apt install code
fi

# Fortigate VPN
VPN_PATH=$(which /opt/forticlient/gui/FortiClient-linux-x64/FortiClient)
if [ "${VPN_PATH}" == "" ]; then
  echo "Installing VPN..."
  curl -s -L -o /tmp/forticlient.deb https://links.fortinet.com/forticlient/deb/vpnagent
  sudo dpkg -i /tmp/forticlient.deb
fi

# Common Scripts
curl -s -o /usr/local/bin/git-clone.sh https://raw.githubusercontent.com/exzeo/linux-install/main/scripts/git-clone.sh
curl -s -o /usr/local/bin/git-push.sh https://raw.githubusercontent.com/exzeo/linux-install/main/scripts/git-push.sh
curl -s -o /usr/local/bin/git-tag.sh https://raw.githubusercontent.com/exzeo/linux-install/main/scripts/git-tag.sh
sudo chmod +x /usr/local/bin/git-clone.sh
sudo chmod +x /usr/local/bin/git-push.sh
sudo chmod +x /usr/local/bin/git-tag.sh
