#!/bin/sh

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mkdir ~/bin
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/undo

cp ~/profile/.fonts.conf ~/.fonts.conf
cp ~/profile/.Xresources ~/.Xresources
cp ~/profile/.vimrc ~/.vimrc
cp ~/profile/.gvimrc ~/.gvimrc
cp ~/profile/.bashrc ~/.bashrc
cp ~/profile/.bash_profile ~/.bash_profile
cp ~/profile/.inputrc ~/.inputrc
cp ~/profile/.xinitrc ~/.xinitrc

cp -a ~/profile/bin/* ~/bin/
cp -a ~/profile/.fluxbox/backgrounds ~/.fluxbox/
cp -a ~/profile/.fluxbox/styles ~/.fluxbox/

cp ~/profile/.fluxbox/apps ~/.fluxbox/apps
cp ~/profile/.fluxbox/init ~/.fluxbox/init
cp ~/profile/.fluxbox/keys ~/.fluxbox/keys
cp ~/profile/.fluxbox/menu ~/.fluxbox/menu
cp ~/profile/.fluxbox/startup ~/.fluxbox/startup

xrdb -merge ~/.Xresources
