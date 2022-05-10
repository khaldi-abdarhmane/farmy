#!/bin/bash

## install workstation

IP=$(hostname -I | awk '{print $2}')

echo "START - install workstation - "$IP

echo "[1]: install utils "
apt-get update -qq >/dev/null
apt-get install -qq -y git sshpass wget ansible gnupg2 curl >/dev/null
echo "END install utils "


echo "[2]: install miniconda"
apt upgrade
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -qq
sudo chmod +777 Miniconda3-latest-Linux-x86_64.sh -qq
./Miniconda3-latest-Linux-x86_64.sh -qq
echo "END install miniconda"

echo "[3]: install awscli"
apt update -qq -y
apt-get install -qq -y awscli
echo "END install AWSCLI "

echo "[3]: install DVC "
wget https://dvc.org/deb/dvc.list -O /etc/apt/sources.list.d/dvc.list
wget -qO - https://dvc.org/deb/iterative.asc | sudo apt-key add -
apt upgrade -qq -y
apt update -qq -y
apt install -qq -y dvc
echo "END install DVC "
echo "END - install workstation"

