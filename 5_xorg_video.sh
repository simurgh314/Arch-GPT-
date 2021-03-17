#!/bin/bash

sudo pacman -Syu --noconfirm xorg-server xorg-xinit xorg-apps xterm mesa-libgl &&

(
echo Y;
echo y;
echo ;
) | git clone https://aur.archlinux.org/nvidia-390xx-utils.git && cd nvidia-390xx-utils && makepkg -sri

(echo Y;
echo y;
echo ;
) | git clone https://aur.archlinux.org/nvidia-390xx.git && cd nvidia-390xx && makepkg -sri


echo 'ШРИФТЫ'
#sudo pacman -S --noconfirm ttf-font-awesome ttf-liberation ttf-dejavu opendesktop-fonts ttf-bitstream-vera ttf-arphic-uming ttf-hanazono ttf-arphic-ukai
