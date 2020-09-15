#!/bin/bash

if [ ! -f /usr/local/bin/sequential-log-generator ]; then
  wget -O /usr/local/bin/sequential-log-generator https://github.com/paynejacob/sequential-log-generator/raw/master/sequential-log-generator
  chmod +x /usr/local/bin/sequential-log-generator
fi

mkdir -n /examplelogs

echo "starting log generator"
sequential-log-generator /examplelogs/a.log,/examplelogs/b.log,/examplelogs/c.log 1000