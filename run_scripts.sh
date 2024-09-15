#!/bin/bash

# bash <(wget -qO- https://raw.githubusercontent.com/tellusaflame/vps_unix_scripts/main/run_scripts.sh)
# wget -O setup_script.sh https://raw.githubusercontent.com/tellusaflame/vps_unix_scripts/main/run_scripts.sh
# chmod +x run_scripts.sh

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

./update_system.sh
./install_docker.sh
./configure_ssh.sh
./install_configure_ufw.sh
./install_3x_ui.sh

echo ""
echo "  ---  Going through scripts completed  ---  "
echo ""

echo "Removing clonned repo..."
cd ~/
sudo rm -rf vps_unix_scripts

echo ""
echo "Confirm ufw enabling please:"
sudo ufw enable

echo "Setup completed successfully! Rebooting in 5s..."
sleep 5

sudo reboot now
