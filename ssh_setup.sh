#!/bin/bash
# Script setting up an ssh server allowing ssh rsa key authentication only

# Author: Julien Duteil
# Created: 23/03/2023

# Checking if script is run as root

if [ "$EUID" -ne 0 ] # If $EUID isn't equal 0 (root)
then
    echo "Script has to be run as root. eg: sudo ./ssh_setup.sh"
    exit # stops the script and exits
else 
    echo "Script is run as root"
fi

# Ask the user for the name of the account they will be used to authenticate

is_valid() {
    declare -a valid=($(for dir in /home/*/; do basename "$dir"; done)) # stocking in the array "valid" the folders' names in /home/
    local value=$uservar # places the value of "uservar" in the local "value"
    for elem in "${valid[@]}"; do # for each value in the array
        [[ $value == $elem ]] && return 0 # makes the test "value" = "elem" if yes returns code 0
    done
    return 1 # if there were no match the return code is 1
}

x=0
while [ "$x" -ne 1 ] # while x isn't equal to 1
do
  echo "Name of the authentication account:"
  read uservar
    if is_valid "$uservar"; # reads the code to know if account is valid or not
    then
        echo "account is valid"
        x=$((x+1))
    else
        echo "$uservar isn't a registered user on this computer"
    fi
done

# Ask the user for the public key path

valid_key_path() {
    local value=$keypath # places the value of "pathvar" in the local "value"
        [[ -f $value ]] && return 0 # makes the test "file exists" returns code 0
    return 1 # if tthe file doesn't exist the return code is 1
}

x=0
while [ "$x" -ne 1 ] # while x isn't equal to 1
do
  echo "Full path to the public rsa key:"
  read keypath
    if valid_key_path "$keypath"; # reads the code to know if the file exists or not
    then
        echo "Key found"
        x=$((x+1))
    else
        echo "Can't find the rsa key"
    fi
done

# Start by installing openssh-server

echo "Updating the packets..."
apt update > /dev/null 2>&1
echo "Installing openssh-server..."
apt install openssh-server -y > /dev/null 2>&1

# Check the installation

pgrep -x sshd >/dev/null && echo "Service sshd is present and running." || { echo "sshd isn't present"; exit; } # Tests if the service sshd is running

if [[ -f /etc/ssh/sshd_config ]] # tests if sshd_config exists in /etc/ssh/
    then
        echo "OpenSSH Server has been installed"
    else
        echo "OpenSSH Server installation failed"
        exit # stops the script
fi

# Make a backup of the sshd_config file

echo "Creating a backup of sshd_config"

backname=sshd_config.bak
cp /etc/ssh/sshd_config /etc/ssh/$backname # creates a backup of sshd_config

if [[ -f /etc/ssh/$backname ]] # tests if sshd_config.bak exists in /etc/ssh/
    then
        echo "Backup of sshd_config done"
    else
        echo "Backup of sshd_config failed"
        exit # stops the script
fi

# Deleting initial sshd_config and creating a new custom one

echo "Deleting sshd_config..." 
rm /etc/ssh/sshd_config
echo "Creating a new sshd_config..."
touch /etc/ssh/sshd_config

# --- Content of the new sshd_config file ---

echo "
Port 666
HostKey /etc/ssh/ssh_host_rsa_key
Ciphers aes256-ctr,aes192-ctr,aes128-ctr
MaxAuthTries 6
StrictModes yes
PubkeyAuthentication yes
PasswordAuthentication no
PermitEmptyPasswords no
KbdInteractiveAuthentication no
UsePAM no
X11Forwarding yes
PrintMotd no
AcceptEnv LANG LC_*
Subsystem       sftp    /usr/lib/openssh/sftp-server" >> /etc/ssh/sshd_config

# --- End of content of the new sshd_config file ---

# Reload the configuration

echo "Reloading configuration..."
/etc/init.d/ssh reload
echo "Configuration reloaded"
echo "Restarting ssh..."
service ssh restart
echo "Ssh restarted"

# Adding public rsa keys to the server

echo "Creating key file..."

if [[ -d /home/$uservar/.ssh ]] # tests if .ssh directory exists
    then
        echo ".ssh directory already exists"
    else
        echo "Directory .ssh missing, creating it"
        mkdir /home/$uservar/.ssh
        chown $uservar /home/$uservar/.ssh && chgrp $uservar /home/$uservar/.ssh # changing folder permissions
        if [[ -d /home/$uservar/.ssh ]] # tests if .ssh directory exists
            then
                echo "Directory .ssh was created"
            else
                echo "Directory creation failed"
                exit # stops the script
        fi
fi

touch /home/$uservar/.ssh/authorized_keys # creating the authorized_keys file

if [[ -f /home/$uservar/.ssh/authorized_keys ]] # tests if authorized_keys for the asked user exists in /home/<user>/.ssh
    then
        echo "Key file created"
        chown $uservar /home/$uservar/.ssh/authorized_keys && chgrp $uservar /home/$uservar/.ssh/authorized_keys # changing file permissions
    else
        echo "Key file creation failed"
        exit # stops the script
fi

# Pushing the RSA public key in authorized_keys

cat $keypath > /home/$uservar/.ssh/authorized_keys

#Checking if keys were copied

size=$(wc -c /home/$uservar/.ssh/authorized_keys | awk '{print $1}') # getting authorized_keys size

if [ "$size" -ne 0 ] # If $size is different than 0
then
    echo "RSA key copy was successful"
else 
    echo "RSA key copy failed"
    exit # stops the script
fi