#!/bin/bash

# === Функция для запуска команд с логированием ===
run_command() {
    eval "$1 &>> ~/setup_script.log"
}

if [ "$1" == "y" ]; then
  echo "Installing nethogs..."

  run_command "sudo apt install nethogs -y"

else
  echo "Passing installing nethogs..."
fi
