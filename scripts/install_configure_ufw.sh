#!/bin/bash

run_command() {
    eval "$1 &>> setup_script.log"  # Выполняем команду и скрываем вывод
    # echo "Нажмите любую клавишу для продолжения..."
    # read -n 1 -s  # Ожидаем нажатия клавиши
    # sleep 1  # Пауза на 1 секунду
}

echo "Installing and configuring UFW..."
run_command "sudo apt -y install ufw"
run_command "sudo ufw default deny incoming"
run_command "sudo ufw default allow outgoing"
run_command "sudo ufw allow 55555"
run_command "sudo ufw allow 443"
run_command "sudo ufw allow 2053"
