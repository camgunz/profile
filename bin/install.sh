#!/bin/sh

mkdir ~/bin
mkdir -p ~/.vim/colors

cp ~/profile/.fonts.conf ~/.fonts.conf
cp ~/profile/.tmux.conf ~/.tmux.conf
cp ~/profile/.Xresources ~/.Xresources
cp ~/profile/.vimrc ~/.vimrc
cp ~/profile/.gvimrc ~/.gvimrc
cp ~/profile/.vim/colors/* ~/.vim/colors

cp -R ~/profile/bin/* ~/bin
cp -R ~/profile/.fluxbox/backgrounds ~/.fluxbox
cp -R ~/profile/.fluxbox/styles ~/.fluxbox

cp ~/profile/.fluxbox/apps ~/.fluxbox
cp ~/profile/.fluxbox/init ~/.fluxbox
cp ~/profile/.fluxbox/keys ~/.fluxbox
cp ~/profile/.fluxbox/menu ~/.fluxbox

xrdb -merge ~/.Xresources

