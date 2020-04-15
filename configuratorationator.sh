#!/bin/bash

# Github user configuration
git_user = "Carter Mak"
git_email = "cartermak3@gmail.com"

git config --global user.name $git_user
git config --global user.email $git_email

# Set up an SSH key pair if one doesn't exist
if [! -d "~/.ssh"]; then
    mkdir ~/.ssh
fi

if [! -f ~/.ssh/id_rsa]; then
    ssh-keygen -t rsa -b 4096 -C $git_email -f "~/.ssh/id_rsa" -N ""
fi

# Install NodeJS
read -p "Install NodeJS?" -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
    sudo apt install -y nodejs
fi

