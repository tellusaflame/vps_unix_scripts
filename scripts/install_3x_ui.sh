#!/bin/bash

run_command() {
    eval "$1 &>> setup_script.log"  # Выполняем команду и скрываем вывод
    # echo "Нажмите любую клавишу для продолжения..."
    # read -n 1 -s  # Ожидаем нажатия клавиши
    # sleep 1  # Пауза на 1 секунду
}

echo "Installing 3X-UI panel..."
run_command "cd ~"
run_command "git clone https://github.com/MHSanaei/3x-ui.git"
run_command "cd 3x-ui"
run_command "git checkout v2.4.0"
run_command "docker compose up -d"

echo "Copying scripts - 3X-UI update & VLESS UDP/TCP masking..."
run_command "cd ~"
run_command "wget -O update_3x-ui.sh https://raw.githubusercontent.com/tellusaflame/scripts/main/update_3x-ui.sh"
run_command "wget -O 3x_ui_port_routing.sh https://raw.githubusercontent.com/tellusaflame/scripts/main/3x_ui_port_routing.sh"
run_command "chmod +x update_3x-ui.sh"
run_command "chmod +x 3x_ui_port_routing.sh"
