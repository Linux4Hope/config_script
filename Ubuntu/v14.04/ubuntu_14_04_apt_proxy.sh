#! bin/bash

#This script is intended for Ubuntu 14.04

# This script is for preparing a computer for donation.  It includes the installation and the removal of programs.

#To run the script, go to working directory of the script.
#For example, if the script is saved in the Desktop folder(on the desktop), if the username is 'linux4hope', go to terminal and enter, 'cd /home/linux4hope/Desktop'
#Next, enter 'source ubuntu.sh', enter the password (entering the password will be shown as blank), hit enter, and the script shall run.

#This script is intended to run on computers that would pull updates from a proxy server over LAN. The proxy server is
#ran by apt-cacher-ng. This is script is ideal for multiple insallations where the adminstrator would like to reduce bandwith and sped up updates.

#setting environment variable in bash to hold our proxy address
#apt-get would then use this to hit our apt-cache-ng server to pull the updates
#change your address as see fit
export http_proxy=http://10.0.0.7:3142

#sudo -E preserves the bash environment variable when sudo is called

echo -e "This script is to prepare the computer for donation by \nupdating, installing, and removing programs. \nTo make sure this script works without problems, please check for error messages.  There may be prompts for user input as well. \nThe script will now begin to make changes."

echo "Please enter your password to start the processes."
sudo -E -v
#'sudo -v' is special. When given the -v (validate) option, sudo will update the user's cached credentials, authenticating the user's password if necessary.  For the sudoers plugin, this extends the sudo timeout for another 15 minutes (or whatever the timeout is set to in sudoers) but does not run a command.  Not all security policies support cached credentials.  Because of different bandwith speeds, we don't want to keep typing in passwords.  This supposed to refresh everything.

echo -e "----------------------------------- \n----------------------------------- \n*********************************** \n----------------------------------- \n-----------------------------------"

#pulls updates
echo "Pulling updates from server."
sudo -E apt-get update


sudo -E -v
echo "Updating programs."
sudo -E apt-get -y upgrade
echo "Update of programs complete."

echo -e "----------------------------------- \n----------------------------------- \n*********************************** \n----------------------------------- \n-----------------------------------"

sudo -E -v
echo "Updating kernel."
sudo -E apt-get -y dist-upgrade
echo "Update of Kernel complete. This script will restart later for changes to take affect."

echo -e "----------------------------------- \n----------------------------------- \n*********************************** \n----------------------------------- \n-----------------------------------"

sudo -E -v
echo "Installing Ubuntu Restricted Extras"
sudo -E apt-get -y install ubuntu-restricted-extras
echo "Ubuntu Restricted Extras Installed."

echo -e "----------------------------------- \n----------------------------------- \n*********************************** \n----------------------------------- \n-----------------------------------"

sudo -E -v
echo "Installing VLC Media Player"
sudo -E apt-get -y install vlc browser-plugin-vlc
echo "VLC Installed."

echo -e "----------------------------------- \n----------------------------------- \n*********************************** \n----------------------------------- \n-----------------------------------"

sudo -E -v
echo "Setting up DVD Playback"
sudo -E /usr/share/doc/libdvdread4/install-css.sh
echo "DVD Playback configured."

echo -e "----------------------------------- \n----------------------------------- \n*********************************** \n----------------------------------- \n-----------------------------------"

sudo -E -v
echo "Cleaning up packages"
sudo -E apt-get -y autoremove
echo "Cleaned up packages in the system."

echo -e "----------------------------------- \n----------------------------------- \n*********************************** \n----------------------------------- \n-----------------------------------"

echo "Removing Config Script"
rm ubuntu_14_04_apt_proxy.sh

echo -e "----------------------------------- \n----------------------------------- \n*********************************** \n----------------------------------- \n-----------------------------------"

#End of processes.  Now having the computer to shutdown.
sudo -E -v
echo -e "End of Script. The computer will now shutdown. \nShutdown Process initiated!"
sudo -E shutdown -h now
