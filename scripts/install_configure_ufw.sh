#!/bin/bash

run_command() {
    eval "$1 &>> ~/setup_script.log"  # Выполняем команду и скрываем вывод
}

if [ "$1" == "y" ]; then

  echo "Installing and configuring UFW..."
  run_command "sudo apt -y install ufw"
  run_command "sudo ufw default deny incoming"
  run_command "sudo ufw default allow outgoing"
  run_command "sudo ufw allow 55555 comment 'SSH'"
  run_command "sudo ufw allow 443 comment '3X-UI VLESS'"
  run_command "sudo ufw allow 2053 comment '3X-UI Panel'"
  run_command "sudo ufw logging off"

else
  echo "Passing UFW installation and configuration..."
fi
