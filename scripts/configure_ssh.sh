#!/bin/bash

run_command() {
    eval "$1 &>> ~/setup_script.log"  # Выполняем команду и скрываем вывод
}

if [ "$1" == "y" ]; then

  echo "Configuring SSH..."
  run_command "sudo bash -c 'echo \"Port 55555\nPasswordAuthentication no\nPubkeyAuthentication yes\nChallengeResponseAuthentication no\nPermitRootLogin yes\nUsePAM yes\n\" > /etc/ssh/sshd_config.d/tellus.conf'"

  echo "Installing and configuring fail2ban..."
  run_command "apt-get install -y fail2ban"

  # Путь к конфигурационному файлу jail.local
  JAIL_LOCAL="/etc/fail2ban/jail.local"

  # Проверка, существует ли jail.local, если нет - создаем его
  if [ ! -f "$JAIL_LOCAL" ]; then
      run_command "touch '$JAIL_LOCAL'"
  fi

  # Добавление конфигурации для sshd
  cat <<EOL > "$JAIL_LOCAL"
  [sshd]
  enabled = true
  port = 55555
  filter = sshd
  logpath = /var/log/auth.log  ; Путь к логам зависит от вашей системы
  maxretry = 5
  bantime = 86400
  findtime = 3600
  EOL

else
  echo "Passing SSH configuration..."
fi


