#!/bin/bash

echo "------- Installing oh-my-zsh && init .zshrc -------"
path=$(cd "$(dirname "$0")"; pwd)

wget https://gitee.com/pocmon/ohmyzsh/raw/master/tools/install.sh -O install.sh 
bash install.sh &

BACK_PID=$!
wait $BACK_PID
cp $path/.zshrc ~/.zshrc

echo "------- Installed oh-my-zsh -------"

bash $path/install-zsh-proxychains-ng.sh 
