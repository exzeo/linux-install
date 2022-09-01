#!/bin/bash

# Local Folder
LOCAL_BIN=$HOME/.local/bin
if [ ! -d "${LOCAL_BIN}" ]; then
  mkdir -p ${LOCAL_BIN}
fi

# Dependencies
echo "Installing dependencies.."
sudo apt-get install -y git curl wget gpg apt-transport-https uidmap unzip 

# Chrome
CHROME_PATH=$(which /opt/google/chrome/chrome)
if [ "${CHROME_PATH}" == "" ]; then
  echo "Installing chrome..."
  curl -s -H 'Cache-Control: no-cache' -o /tmp/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb
fi

# ASDF
if [ ! -d "${HOME}/.asdf" ]; then
  echo "Installing asdf..."
  git clone https://github.com/asdf-vm/asdf.git ${HOME}/.asdf
  
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
fi

# Get plugins
curl -s -H 'Cache-Control: no-cache' -L https://raw.githubusercontent.com/exzeo/linux-install/main/scripts/install-asdf-plugins.sh | bash

# Get tools versions
curl -s -H 'Cache-Control: no-cache' -o ${HOME}/.tool-versions https://raw.githubusercontent.com/exzeo/linux-install/main/files/.tool-versions
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
  curl -s -L -H 'Cache-Control: no-cache' -o /tmp/forticlient.deb https://links.fortinet.com/forticlient/deb/vpnagent
  sudo dpkg -i /tmp/forticlient.deb
fi

# Kubectx
KCTX_PATH=$(which ${LOCAL_BIN}/kubectx)
if [ "${KCTX_PATH}" == "" ]; then
  echo "Installing Kubectx..."
  curl -s -L -H 'Cache-Control: no-cache' -o ${LOCAL_BIN}/kubectx https://raw.githubusercontent.com/ahmetb/kubectx/master/kubectx
  sudo chmod +x ${LOCAL_BIN}/kubectx
fi

# Kubens
KNS_PATH=$(which ${LOCAL_BIN}/kubens)
if [ "${KNS_PATH}" == "" ]; then
  echo "Installing Kubens..."
  curl -s -L -H 'Cache-Control: no-cache' -o ${LOCAL_BIN}/kubens https://raw.githubusercontent.com/ahmetb/kubectx/master/kubens
  sudo chmod +x ${LOCAL_BIN}/kubens
fi

# Slack
SLACK_PATH=$(which slack)
if [ "${SLACK_PATH}" == "" ]; then
  echo "Installing Slack..."
  sudo snap install slack
fi

# Postman
POSTMAN_PATH=$(which /snap/bin/postman)
if [ "${POSTMAN_PATH}" == "" ]; then
  echo "Installing Postman..."
  sudo snap install postman
fi

# Prospect Mail
PROSPECT_MAIL_PATH=$(which /snap/bin/prospect-mail)
if [ "${PROSPECT_MAIL_PATH}" == "" ]; then
  echo "Installing Prospect Mail..."
  sudo snap install prospect-mail
fi

# Docker
DOCKER_PATH=$(which docker)
if [ "${DOCKER_PATH}" == "" ]; then
  echo "Installing docker..."
  curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
  sudo chmod +x /tmp/get-docker.sh
  /tmp/get-docker.sh
fi

dockerd-rootless-setuptool.sh install

# Common Scripts
curl -s -L -H 'Cache-Control: no-cache' -o ${LOCAL_BIN}/git-clone.sh https://raw.githubusercontent.com/exzeo/linux-install/main/scripts/git-clone.sh
curl -s -L -H 'Cache-Control: no-cache' -o ${LOCAL_BIN}/git-push.sh https://raw.githubusercontent.com/exzeo/linux-install/main/scripts/git-push.sh
curl -s -L -H 'Cache-Control: no-cache' -o ${LOCAL_BIN}/git-tag.sh https://raw.githubusercontent.com/exzeo/linux-install/main/scripts/git-tag.sh
sudo chmod +x ${LOCAL_BIN}/git-clone.sh
sudo chmod +x ${LOCAL_BIN}/git-push.sh
sudo chmod +x ${LOCAL_BIN}/git-tag.sh

# Symbolic Links
sudo ln -s ${HOME}/.asdf/shims/kubectl /usr/local/bin/kubectl --force
sudo ln -s ${HOME}/.asdf/shims/go /usr/local/bin/go --force