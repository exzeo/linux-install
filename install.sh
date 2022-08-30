#!/bin/bash

# Dependencies
sudo apt-get install -y git curl

# Chrome
curl -s -o /tmp/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb

# ASDF
if [ ! -d "${HOME}/.asdf" ]; then
    git clone https://github.com/asdf-vm/asdf.git ${HOME}/.asdf
else
    git -C ${HOME}/.asdf pull origin master
fi

# Get tools versions
curl -s -o ${HOME}/.tool-versions https://raw.githubusercontent.com/exzeo/linux-install/main/files/.tool-versions