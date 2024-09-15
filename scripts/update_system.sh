#!/bin/bash

run_command() {
    eval "$1 &>> setup_script.log"  # Выполняем команду и скрываем вывод
    # echo "Нажмите любую клавишу для продолжения..."
    # read -n 1 -s  # Ожидаем нажатия клавиши
    # sleep 1  # Пауза на 1 секунду
}

echo "Updating system components..."
run_command "sudo apt update -qq && sudo apt upgrade -qq -y"
