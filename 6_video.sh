#!/bin/bash


cd && git clone https://aur.archlinux.org/nvidia-390xx-utils.git && cd nvidia-390xx-utils && makepkg -sri &&

cd && git clone https://aur.archlinux.org/nvidia-390xx.git && cd nvidia-390xx && makepkg -sri

cd && git clone https://aur.archlinux.org/polybar.git && cd polybar && makepkg -sri
