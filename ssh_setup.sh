#!/bin/bash
# Script setting up an ssh server with ssh key authentication only

# Author: Julien Duteil
# Created: 22/03/2023

# Checking if script is run as root

if [ "$EUID" -ne 0 ] # si $EUID n'est pas égal à 0 (root)
then
    echo "Script has to be run as root. eg: sudo ./archive.sh"
    exit # arrête le script
else 
    echo "Script is run as root"
fi

# Start by installing openssh-server

apt update > /dev/null 2>&1
echo "Installing openssh-server..."
apt install openssh-server > /dev/null 2>&1

if [[ -f /etc/ssh/ssh_config ]] # teste si le fichier "nom du fichier" + .bak existe déjà OU si le nom du fichier se termine par .bak
    then
        : # si oui ne rien faire
    else
        echo "OpenSSH Server isn't installed"
    fi