#!/bin/bash

# bash <(wget -qO- https://raw.githubusercontent.com/tellusaflame/vps_unix_scripts/main/run_scripts.sh)
# wget -O setup_script.sh https://raw.githubusercontent.com/tellusaflame/vps_unix_scripts/main/run_scripts.sh
# chmod +x run_scripts.sh

clear

echo "Installing Git..."
sudo apt-get install git -y &>> setup_script.log

echo "Cloning repo with scripts..."
git clone https://github.com/tellusaflame/vps_unix_scripts.git &>> setup_script.log

cd ~/vps_unix_scripts/scripts

echo "Making scripts executable..."
chmod +x *.sh

echo ""
echo "Going through scripts:"
./update_system.sh
./install_docker.sh
./configure_ssh.sh
./install_configure_ufw.sh
./install_3x_ui.sh

echo "Confirm ufw enabling please:"
echo ""
sudo ufw enable

echo "Setup completed successfully! Rebooting..."
sleep 5

sudo reboot now
