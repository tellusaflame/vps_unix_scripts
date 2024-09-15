#!/bin/bash

# bash <(wget -qO- https://raw.githubusercontent.com/tellusaflame/vps_unix_scripts/main/run_scripts.sh)
# wget -O setup_script.sh https://raw.githubusercontent.com/tellusaflame/vps_unix_scripts/main/run_scripts.sh
# chmod +x run_scripts.sh

run_command() {
    eval "$1 &>> ~/vps_unix_scripts/scripts/setup_script.log"
}

echo "Installing Git..."
run_command "sudo apt-get install git -y"

echo "Cloning repo with scripts..."
run_command "git clone git@github.com:tellusaflame/vps_unix_scripts.git"

cd ~/vps_unix_scripts/scripts

echo "Making scripts executable..."
chmod +x *.sh

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

run_command "sudo reboot now"
