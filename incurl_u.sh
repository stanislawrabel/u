#!/bin/bash
set -e

# 🛠 Automatický mód
export DEBIAN_FRONTEND=noninteractive
export TERM=xterm

set -e

echo "📦 Updating Termux and installing dependencies..."
yes "" | pkg update -y
yes "" | pkg upgrade -y
echo N | dpkg --configure -a

pkg install -y python python2 git tsu curl
pkg install aria2 -y

echo "📥 Downloading scripts and data files..."
REPO="https://raw.githubusercontent.com/stanislawrabel/u/main"

curl -fsSL "$REPO/u.sh" -o u.sh


chmod +x u.sh

# 🛠️ Adding an alias for easy launch 
if ! grep -q "alias u=" ~/.bashrc; then
    echo "alias u='bash ~/u.sh'" >> ~/.bashrc
    echo -e "\e[32m✅ Alias 'u' has been added.\e[0m"
fi
source ~/.bashrc
clear
exit