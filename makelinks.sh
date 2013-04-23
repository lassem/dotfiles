#!/bin/sh
DIR="$( cd "$( dirname "$0" )" && pwd )"
ln -fs $HOME/.dotfiles/.bash_profile ~/.bash_profile
ln -fs $HOME/.dotfiles/.bashrc ~/.bashrc
ln -fs $HOME/.dotfiles/.vim ~/.vim
ln -fs $HOME/.dotfiles/.gitconfig ~/.gitconfig
