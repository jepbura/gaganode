#!/bin/sh

cpu_arch="$(uname -m)"
echo "cpu_arch=$cpu_arch"
AMD="https://assets.coreservice.io/public/package/22/app/1.0.3/app-1_0_3.tar.gz"
ARM="https://assets.coreservice.io/public/package/24/app/1.0.3/app-1_0_3.tar.gz"

if [ "${cpu_arch}" = "x86_64" ]; then
DOWNLOADLINK=$AMD
FILENAME="app-linux-amd64.tar.gz"
elif [[ "${cpu_arch}" = "arm64" ]] || [[ "${cpu_arch}" = "aarch64" ]]; then
DOWNLOADLINK=$ARM
FILENAME="app-linux-arm64.tar.gz"
else
echo "Your CPU type dose not support" 
exit 1
fi

echo "DOWNLOADLINK=$DOWNLOADLINK"

if [ -d ./app-linux* ]; then
echo "app-linux found" &&
cd ./app-linux* &&
sudo ./app service start &&
sudo ./app status &&
sudo ./app log &&
sudo ./apps/gaganode/gaganode log &&
cat ./apps/gaganode/user_conf/default.toml
else
echo "app-linux NOT found."
sudo curl -o $FILENAME $DOWNLOADLINK &&
sudo tar -zxf $FILENAME &&
sudo rm -f $FILENAME &&
cd ./app-linux* &&
sudo ./app service install  &&
sudo ./app service start &&
sudo ./app status &&
sleep 30 && echo ' ____   ___  _   _ _____
|  _ \ / _ \| \ | | ____|
| | | | | | |  \| |  _|
| |_| | |_| | |\  | |___
|____/ \___/|_| \_|_____|'
sudo ./app status && 
sudo ./apps/gaganode/gaganode config set --token=$TOKEN &&
sudo ./app restart &&
sudo ./apps/gaganode/gaganode log
fi

/bin/bash