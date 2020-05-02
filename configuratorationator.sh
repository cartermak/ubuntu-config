#!/bin/bash

# Start with a good old update
sudo apt update

# Github user configuration
read -p "Setup git? " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
    git_user="cartermak"
    git_email="cartermak3@gmail.com"

    git config --global user.name $git_user
    git config --global user.email $git_email
fi

# SSH key
read -p "Create SSH key? " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
    # Set up an SSH key pair if one doesn't exist
    if [ ! -d "~/.ssh" ]; then
        mkdir ~/.ssh
    fi

    if [ ! -f "~/.ssh/id_rsa" ]; then
        ssh-keygen -t rsa -b 4096 -N "" -C $git_email -f ~/.ssh/id_rsa
    fi

fi

# Install NodeJS
read -p "Install NodeJS? " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
    sudo apt install -y nodejs
fi

# Install snap
read -p "Install snap? " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
   sudo apt install -y snapd

    # Install VS Code
    read -p "Install VS Code? " -n 1 -r
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        sudo snap install --classic code
    fi

fi
