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

  # Запрос публичного SSH-ключа
  read -p "Enter your public SSH key (or leave the field blank to skip): " ssh_key

  if [[ -n "$ssh_key" ]]; then
      echo "Adding the SSH key to authorized_keys..."
      
      # Убедимся, что каталог .ssh существует
      mkdir -p ~/.ssh

      # Добавляем ключ в файл authorized_keys
      echo "$ssh_key" >> ~/.ssh/authorized_keys

      # Устанавливаем правильные права для файла и директории
      chmod 700 ~/.ssh
      chmod 600 ~/.ssh/authorized_keys

      echo "The public SSH key is added to authorized_keys and permissions are set."
  else
      echo "SSH key is not specified. Skip this step."
  fi

else
  echo "Passing SSH configuration..."
fi
