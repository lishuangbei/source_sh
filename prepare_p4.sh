#!/bin/bash

# define $SUDO, in container 'sudo' is not needed
if [ "$1" = "--sudo" ]; then
    SUDO="sudo"
else
    SUDO=""
fi

$SUDO apt-get install -y wget
$SUDO apt-get install -y gnupg
wget -qO - https://package.perforce.com/perforce.pubkey | gpg --dearmor | $SUDO tee /usr/share/keyrings/perforce.gpg

# Add perforce address to list; jammy is the codename for **Ubuntu 22.04**
echo "deb [signed-by=/usr/share/keyrings/perforce.gpg] https://package.perforce.com/apt/ubuntu jammy release" | $SUDO tee /etc/apt/sources.list.d/perforce.list

# Update package list
$SUDO apt-get update

# Install perforce client
$SUDO apt-get install -y helix-cli

# set up p4 configuration
export P4PORT=192.168.16.174:1666
export P4USER=shuangbei.li