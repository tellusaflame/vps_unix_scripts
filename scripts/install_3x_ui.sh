#!/bin/bash

run_command() {
    eval "$1 &>> ~/setup_script.log"  # Выполняем команду и скрываем вывод
}

if [ "$1" == "y" ]; then

  echo "Installing 3X-UI panel..."
  run_command "cd ~"
  run_command "mkdir -p ~/3x-ui"
  run_command "cd ~/3x-ui"
  
  cat > ~/3x-ui/docker-compose.yml <<EOF
services:
  3xui:
    image: ghcr.io/mhsanaei/3x-ui:latest
    container_name: 3xui_app
    # hostname: yourhostname <- optional
    volumes:
      - \$PWD/db/:/etc/x-ui/
      - \$PWD/cert/:/root/cert/
    environment:
      XRAY_VMESS_AEAD_FORCED: "false"
      XUI_ENABLE_FAIL2BAN: "true"
    tty: true
    network_mode: host
    restart: unless-stopped
EOF

  echo "Starting 3X-UI..."
  run_command "cd ~/3x-ui && docker compose up -d"

  echo "Copying scripts - 3X-UI update & VLESS UDP/TCP masking..."
  run_command "cd ~"
  run_command "wget -O update_3x-ui.sh https://raw.githubusercontent.com/tellusaflame/scripts/main/update_3x-ui.sh"
  run_command "wget -O 3x_ui_port_routing.sh https://raw.githubusercontent.com/tellusaflame/scripts/main/3x_ui_port_routing.sh"
  run_command "chmod +x update_3x-ui.sh"
  run_command "chmod +x 3x_ui_port_routing.sh"

else
  echo "Passing installing 3X-UI panel..."
fi
