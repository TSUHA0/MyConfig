#!/bin/bash


echo " > start install neovim"

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

sudo pip3 install neovim
sudo pip3 install pynvim
npm install -g neovim

echo " > neovim installed"
