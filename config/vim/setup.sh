#!/bin/sh
set -e

sudo dnf install -y neovim nodejs npm python-pip python3-pip
sudo npm install -g neovim
sudo npm install -g yarn
pip install -g pynvim
pip3 install -g pynvim
cp .vimrc ~/.vimrc
[ -d $HOME"/.config/nvim" ] || mkdir -p $HOME"/.config/nvim"
ln -s $HOME"/.vimrc" $HOME"/.config/nvim/init.vim"

