#!/bin/bash

run_command() {
    eval "$1 &>> ~/setup_script.log"  # Выполняем команду и пишем вывод в лог
}

if [ "$1" == "y" ]; then

  echo "Installing Tailscale..."
  run_command "curl -fsSL https://tailscale.com/install.sh | sh"

  echo "Installing NetBird..."
  run_command "curl -fsSL https://pkgs.netbird.io/install.sh | sh"

else
  echo "Passing Tailscale & NetBird installation..."
fi
