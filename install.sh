#!/bin/bash

# Dependencies
sudo apt-get install -y git curl

# Chrome
curl -s -o /tmp/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb

# ASDF
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
curl -s -o ~/.tool-versions https://raw.githubusercontent.com/exzeo/linux-install/master/files/.tool-versions