#!/bin/bash

sudo clear

echo "Installing Git..."
sudo apt-get install git -y &>> setup_script.log

echo "Cloning repo with scripts..."
git clone https://github.com/tellusaflame/vps_unix_scripts.git &>> setup_script.log

cd ~/vps_unix_scripts/scripts

echo "Making scripts executable..."
chmod +x *.sh

echo ""
echo "  ---      Going through scripts      ---  "
echo ""

./update_system.sh y
./install_docker.sh n
./configure_ssh.sh n
./install_configure_ufw.sh y
./install_3x_ui.sh y

echo ""
echo "  ---  Going through scripts completed  ---  "
echo ""

echo "Removing clonned repo..."
cd ~/
sudo rm -rf vps_unix_scripts

echo ""
echo "Confirm ufw enabling please:"
sudo ufw enable

echo ""
echo "Setup completed successfully! Rebooting in 5s..."
sleep 5

sudo reboot now
