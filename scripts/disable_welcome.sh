#!/bin/bash

# === Функция для запуска команд с логированием ===
run_command() {
    eval "$1 &>> ~/setup_script.log"
}

if [ "$1" == "y" ]; then
  echo "Disabling unnecessary MOTD scripts..."

  run_command "sudo chmod -x /etc/update-motd.d/10-help-text"
  run_command "sudo chmod -x /etc/update-motd.d/50-motd-news"
  run_command "sudo chmod -x /etc/update-motd.d/85-fwupd"
  run_command "sudo chmod -x /etc/update-motd.d/91-contract-ua-esm-status"
  run_command "sudo chmod -x /etc/update-motd.d/92-unattended-upgrades"
  run_command "sudo chmod -x /etc/update-motd.d/97-overlayroot"
  run_command "sudo chmod -x /etc/update-motd.d/98-reboot-required"
  run_command "sudo chmod -x /etc/update-motd.d/90-updates-available"
  run_command "sudo chmod -x /etc/update-motd.d/91-release-upgrade"
  run_command "sudo chmod -x /etc/update-motd.d/95-hwe-eol"
  run_command "sudo chmod -x /etc/update-motd.d/98-fsck-at-reboot"
  run_command "sudo chmod +x /etc/update-motd.d/50-landscape-sysinfo"

  echo "MOTD setup completed."
else
  echo "Passing MOTD customization..."
fi
