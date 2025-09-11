#!/bin/bash

run_command() {
    eval "$1 &>> ~/setup_script.log"  # Выполняем команду и пишем вывод в лог
}

if [ "$1" == "y" ]; then

  echo "Installing vnStat..."
  run_command "sudo apt install vnstat -y"

else
  echo "Passing Tailscale & NetBird installation..."
fi
