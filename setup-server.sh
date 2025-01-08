#!/bin/bash

# Оновлюємо систему
echo "Оновлюємо систему..."
sudo apt update && sudo apt upgrade -y

sudo apt install -y xfce4 xfce4-goodies

sudo apt install -y xrdp

sudo bash -c 'echo "startxfce4" > /etc/xrdp/startwm.sh'

sudo systemctl restart xrdp

sudo systemctl enable xrdp

sudo ufw allow 3389/tcp

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo dpkg -i google-chrome-stable_current_amd64.deb

sudo apt install -f -y

rm google-chrome-stable_current_amd64.deb

mkdir -p ~/chrome-extensions/extension_name

wget "https://github.com/ofresh/openledger/raw/main/DAWN-Validator-Chrome-Extension-Chrome.crx" -O ~/chrome-extensions/extension_name.crx

unzip ~/chrome-extensions/DAWN-Validator-Chrome-Extension-Chrome.crx -d ~/chrome-extensions/DAWN-Validator-Chrome-Extension-Chrome

sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt update

sudo apt install -y docker-ce

sudo systemctl enable docker
sudo systemctl start docker


echo "Завантажуємо OpenLedger Node..."
wget https://cdn.openledger.xyz/openledger-node-1.0.0-linux.zip

unzip openledger-node-1.0.0-linux.zip

sudo dpkg -i openledger-node-1.0.0.deb

# Повідомлення про завершення установки OpenLedger Node
echo "OpenLedger Node успішно встановлено!"

# Очищаємо кеш APT
echo "Очищаємо кеш APT..."
sudo apt clean

# Повідомлення про завершення
echo "Установка завершена успішно!"
