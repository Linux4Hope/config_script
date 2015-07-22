#! bin/bash

#This script is intended for Ubuntu 12.04

# This script is for preparing a computer for donation.  It includes the installation and the removal of programs.

#To run the script, go to working directory of the script.
#For example, if the script is saved in the Desktop folder(on the desktop), if the username is 'linux4hope', go to terminal and enter, 'cd /home/linux4hope/Desktop'
#Next, enter 'source ubuntu.sh', enter the password (entering the password will be shown as blank), hit enter, and the script shall run.

echo -e "This script is to prepare the computer for donation by \nupdating, installing, and removing programs. \nTo make sure this script works without problems, please check for error messages.  There may be prompts for user input as well. \nThe script will now begin to make changes."

echo "Please enter your password to start the processes."
sudo -v
#'sudo -v' is special. When given the -v (validate) option, sudo will update the user's cached credentials, authenticating the user's password if necessary.  For the sudoers plugin, this extends the sudo timeout for another 15 minutes (or whatever the timeout is set to in sudoers) but does not run a command.  Not all security policies support cached credentials.  Because of different bandwith speeds, we don't want to keep typing in passwords.  This supposed to refresh everything.

echo -e "----------------------------------- \n----------------------------------- \n*********************************** \n----------------------------------- \n-----------------------------------"


#pulls updates 
echo "Pulling updates from server."
sudo apt-get update  


sudo -v
echo "Updating programs."
sudo apt-get -y upgrade
echo "Update of programs complete."

echo -e "----------------------------------- \n----------------------------------- \n*********************************** \n----------------------------------- \n-----------------------------------"

sudo -v
echo "Updating kernel."
sudo apt-get -y dist-upgrade
echo "Update of Kernel complete. This script will restart later for changes to take affect."

echo -e "----------------------------------- \n----------------------------------- \n*********************************** \n----------------------------------- \n-----------------------------------"


sudo -v
echo "Installing Gnome Panel"
sudo apt-get -y install gnome-session-fallback
echo "Gnome Panel is installed."

echo -e "----------------------------------- \n----------------------------------- \n*********************************** \n----------------------------------- \n-----------------------------------"


sudo -v
echo "Installing Ubuntu Restricted Extras"
sudo apt-get -y install ubuntu-restricted-extras
echo "Ubuntu Restricted Extras Installed."

echo -e "----------------------------------- \n----------------------------------- \n*********************************** \n----------------------------------- \n-----------------------------------"


sudo -v
echo "Installing Synaptic Package Manager"
sudo apt-get -y install synaptic
echo "Synaptic is Installed."

echo -e "----------------------------------- \n----------------------------------- \n*********************************** \n----------------------------------- \n-----------------------------------"


sudo -v
echo "Installing VLC"
sudo apt-get -y install vlc
echo "VLC is installed."

echo -e "----------------------------------- \n----------------------------------- \n*********************************** \n----------------------------------- \n-----------------------------------"


sudo -v
#Adding the ability to play DVDs http://www.medibuntu.org/repository.php
echo "Installing DVD Play Back Tools" #works properly with VLC installed
sudo -E wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list 
sudo -v
sudo apt-get --quiet update
sudo -v
sudo apt-get --yes --quiet --allow-unauthenticated install medibuntu-keyring
sudo -v 
sudo apt-get --quiet update
sudo -v
sudo apt-get -y install app-install-data-medibuntu
sudo apt-get -y install apport-hooks-medibuntu 
sudo apt-get -y install libdvdcss2
echo "DVD Play Back Tools Installed."

echo -e "----------------------------------- \n----------------------------------- \n*********************************** \n----------------------------------- \n-----------------------------------"

sudo -v
echo "Removing Unity and its config files."
sudo apt-get -y purge unity 
sudo apt-get -y purge unity-2d 
sudo apt-get -y purge unity-2d-panel
echo "Unity is removed."

echo -e "----------------------------------- \n----------------------------------- \n*********************************** \n----------------------------------- \n-----------------------------------"

#End of processes.  Now having the computer to restart.
sudo -v
echo -e "End of Script. The computer will restart. \nShutdown Process initiated!"
sudo shutdown -r now


