#!/bin/sh
DIR="$( cd "$( dirname "$0" )" && pwd )"
ln -s $DIR/.bash_profile ~/.bash_profile
ln -s $DIR/.vim ~/.vim
ln -s $DIR/.gitconfig ~/.gitconfig
