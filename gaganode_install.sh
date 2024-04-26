#!/bin/bash

cpu_arch="$(uname -m)"
echo "cpu_arch=$cpu_arch"

if [[ ! ("$cpu_arch" == "x86_64" || "$cpu_arch" == "amd64" || "$cpu_arch" == "arm64" || "$cpu_arch" == "aarch64") ]]; then
    echo "Your CPU type is not supported."
    exit 1
fi

echo "DOWNLOADLINK=$DOWNLOADLINK"
echo "FILENAME=$FILENAME"
echo "TOKEN=$TOKEN"

if [ -d ./apphub-linux* ]; then
    echo "apphub-linux found" &&
        cd ./apphub-linux* &&
        sudo ./apphub service start &&
        sudo ./apphub status &&
        sudo ./apphub log &&
        sudo ./apps/gaganode/gaganode log &&
        cat ./apps/gaganode/user_conf/default.toml
else
    echo "apphub-linux does not exist" &&
        sudo curl -o $FILENAME $DOWNLOADLINK &&
        sudo tar -zxf $FILENAME &&
        sudo rm -f $FILENAME &&
        cd ./apphub-linux* &&
        sudo ./apphub service remove &&
        sudo ./apphub service install
    sudo ./apphub service start
    sudo ./apphub status &&
        sleep 30 && echo ' ____   ___  _   _ _____
|  _ \ / _ \| \ | | ____|
| | | | | | |  \| |  _|
| |_| | |_| | |\  | |___
|____/ \___/|_| \_|_____|'
    sudo ./apphub status &&
        sudo ./apps/gaganode/gaganode config set --token=$TOKEN &&
        sudo ./apphub restart &&
        sudo ./apps/gaganode/gaganode log
fi

/bin/bash
