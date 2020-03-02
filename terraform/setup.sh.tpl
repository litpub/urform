#!/bin/bash

sudo apt-get update

# Download Urbit
mkdir temp
curl -o temp/archive.tgz https://bootstrap.urbit.org/urbit-linux64-${urbit_version}.tgz
tar xzf temp/archive.tgz -C temp/
rm temp/archive.tgz
chmod -R 740 temp/urbit-linux64-${urbit_version}/
mv temp/urbit-linux64-${urbit_version}/* ./
rm -rf temp/urbit-linux64-${urbit_version}/

# Allocate swap
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# Boot Urbit for the first time
./urbit -x -w ${patp} -k /tmp/keyfile.key
shred -vzn 3 /tmp/keyfile.key
rm /tmp/keyfile.key

# Run Urbit in screen
screen -S urbit -dm ./urbit ${patp}