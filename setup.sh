#!/bin/bash

sudo apt-get update
sudo apt-get -y install apt-transport-https

# Desktop environment
sudo apt-get install -y i3 i3lock rofi arandr autorandr py3status fish compton numlockx xautolock

# Debugging tools
sudo apt-get install -y vim htop tmux chrony build-essential 

# Security cards
sudo apt-get install -y opensc pcscd scdaemon yubico-piv-tool

# Daily tooling
sudo apt-get -y install git

# Switch to fish
sudo chsh -s /usr/bin/fish ${USER}

# Configure intel graphics
# Without this, X1 Carbon suffers a crash killing X after closing the lid
sudo mkdir -p /etc/X11/xorg.conf.d
sudo cp xorg/20-intel.conf /etc/X11/xorg.conf.d/

# Ensure the screen is locked on suspend via systemd
# and autorandr -c is run on resume (in case screen configuration has changed)
sudo cp systemd/lock-and-suspend\@.service /etc/systemd/system/
sudo cp systemd/autorandr-on-resume\@.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable lock-and-suspend@${USER}
sudo systemctl enable autorandr-on-resume@${USER}

