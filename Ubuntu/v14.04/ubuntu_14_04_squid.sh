#! bin/bash

#This script is intended for Ubuntu 14.04

# This script is for preparing a computer for donation.  It includes the installation and the removal of programs.

#To run the script, go to working directory of the script.
#For example, if the script is saved in the Desktop folder(on the desktop), if the username is 'linux4hope', go to terminal and enter, 'cd /home/linux4hope/Desktop'
#Next, enter 'source ubuntu.sh', enter the password (entering the password will be shown as blank), hit enter, and the script shall run.

#This script is intended to run on computers that would pull updates from the a server on LAN. squid-deb-proxy-server must be on another computer and
#running on the same LAN. This script will install the squid-deb-proxy client on this computer and then remove and clean up afterwards. This script is ideal for
#multiple installations where the adminstrator would like to reduce bandwith and speed up updates.

echo -e "This script is to prepare the computer for donation by \nupdating, installing, and removing programs. \nTo make sure this script works without problems, please check for error messages.  There may be prompts for user input as well. \nThe script will now begin to make changes."

echo "Please enter your password to start the processes."
sudo -v
#'sudo -v' is special. When given the -v (validate) option, sudo will update the user's cached credentials, authenticating the user's password if necessary.  For the sudoers plugin, this extends the sudo timeout for another 15 minutes (or whatever the timeout is set to in sudoers) but does not run a command.  Not all security policies support cached credentials.  Because of different bandwith speeds, we don't want to keep typing in passwords.  This supposed to refresh everything.

echo -e "----------------------------------- \n----------------------------------- \n*********************************** \n----------------------------------- \n-----------------------------------"

echo "Installing squid-deb-proxy client"
sudo apt-get -y install squid-deb-proxy-client
echo "Install of squid-deb-proxy-client completed."

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
echo "Installing Ubuntu Restricted Extras"
sudo apt-get -y install ubuntu-restricted-extras
echo "Ubuntu Restricted Extras Installed."

echo -e "----------------------------------- \n----------------------------------- \n*********************************** \n----------------------------------- \n-----------------------------------"

sudo -v
echo "Installing VLC Media Player"
sudo apt-get -y install vlc browser-plugin-vlc
echo "VLC Installed."

echo -e "----------------------------------- \n----------------------------------- \n*********************************** \n----------------------------------- \n-----------------------------------"

sudo -v
echo "Setting up DVD Playback"
sudo /usr/share/doc/libdvdread4/install-css.sh
echo "DVD Playback configured."

echo -e "----------------------------------- \n----------------------------------- \n*********************************** \n----------------------------------- \n-----------------------------------"

sudo -v
echo "Uninstalling squid-deb-proxy-client"
sudo apt-get purge -y squid-deb-proxy-client
echo "Removed squid-deb-proxy-client and its configuration files."


sudo -v
echo "Cleaning up packages"
sudo apt-get -y autoremove
echo "Cleaned up packages in the system."

echo -e "----------------------------------- \n----------------------------------- \n*********************************** \n----------------------------------- \n-----------------------------------"

echo "Removing Config Script"
rm ubuntu_14_04_squid.sh

echo -e "----------------------------------- \n----------------------------------- \n*********************************** \n----------------------------------- \n-----------------------------------"

#End of processes.  Now having the computer to shutdown.
sudo -v
echo -e "End of Script. The computer will now shutdown. \nShutdown Process initiated!"
sudo shutdown -h now
