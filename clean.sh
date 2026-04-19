#!/usr/bin/env bash
set -e

echo "== Очистка APT кэша =="
sudo apt clean

echo "== Удаление неиспользуемых пакетов и старых ядер =="
sudo apt autoremove --purge -y

echo "== Очистка systemd логов (старше 7 дней) =="
sudo journalctl --vacuum-time=7d

echo "== Очистка пользовательского кэша =="
rm -rf "$HOME/.cache/"*

echo "== Готово =="
