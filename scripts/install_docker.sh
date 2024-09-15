#!/bin/bash

run_command() {
    eval "$1 &>> ~/setup_script.log"  # Выполняем команду и скрываем вывод
}

if [ "$1" == "y" ]; then

  echo "Installing Docker..."
  run_command "curl -fsSL https://get.docker.com -o get-docker.sh"
  run_command "sudo sh get-docker.sh"

  echo "Installing Docker Compose..."
  run_command "sudo apt-get install docker-compose -y"

else
  echo "Passing Docker installation..."
fi