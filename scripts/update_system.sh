#!/bin/bash

run_command() {
    eval "$1 &>> ~/setup_script.log"  # Выполняем команду и скрываем вывод
}

if [ "$1" == "y" ]; then

  echo "Updating system components..."
  run_command "sudo apt update -qq && sudo apt upgrade -qq -y"

else
  echo "Passing system update..."
fi
