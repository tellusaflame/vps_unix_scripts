#!/bin/bash

run_command() {
    eval "$1 &>> ~/setup_script.log"  # Выполняем команду и скрываем вывод
}

if [ "$1" == "y" ]; then

  echo "Configuring SSH..."
  {
      echo "Port 55555"
      echo "PasswordAuthentication no"
      echo "PubkeyAuthentication yes"
      echo "ChallengeResponseAuthentication no"
      echo "PermitRootLogin yes"
      echo "UsePAM yes"
    } > "/etc/ssh/sshd_config.d/tellus.conf"

  echo "Installing and configuring fail2ban..."
  run_command "apt-get install -y fail2ban"

  # Путь к конфигурационному файлу jail.local
  JAIL_LOCAL="/etc/fail2ban/jail.local"

# Добавление конфигурации для sshd
{
    echo "[sshd]"
    echo "enabled = true"
    echo "port = 55555"
    echo "filter = sshd"
    echo "logpath = /var/log/auth.log"
    echo "maxretry = 5"
    echo "bantime = 86400"
    echo "findtime = 3600"
} > "$JAIL_LOCAL"

else
  echo "Passing SSH configuration..."
fi