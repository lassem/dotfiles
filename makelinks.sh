#!/bin/sh
DIR="$( cd "$( dirname "$0" )" && pwd )"
ln -fs $DIR/.bash_profile ~/.bash_profile
ln -fs $DIR/.bashrc ~/.bashrc
ln -fs $DIR/.vim ~/.vim
ln -fs $DIR/.gitconfig ~/.gitconfig
