#!/bin/bash

if [ ! -e /usr/local/bin/sequential-log-generator ]; then
  echo "Installing binary"
  sudo wget -O /usr/local/bin/sequential-log-generator https://github.com/paynejacob/sequential-log-generator/raw/master/sequential-log-generator
  sudo chmod +x /usr/local/bin/sequential-log-generator
fi

sudo mkdir -p /examplelogs

echo "starting log generator"
sudo sequential-log-generator /examplelogs/a.log,/examplelogs/b.log,/examplelogs/c.log 1000
