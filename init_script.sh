#!/bin/sh

echo "Run the script as a sudo user"

echo "Installing needed utilities and Ansible"

sudo apt-get update

sudo apt install -y wget vim tree git ansible sshpass
