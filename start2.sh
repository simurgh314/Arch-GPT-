#!/bin/bash

echo '====================================='
read -p "Введите имя компьютера: " HOST
read -p "Введите имя нового пользователя" USER
read -p "Укажите часовой пояс в формате  Europe/Moscow  " POYAS


echo 'ЛОКАЛИЗАЦИЯ ЧАСЫ и ПРОЧЕЕ' 

hostnamectl set-hostname $HOST &&
ln -sf /usr/share/zoneinfo/$POYAS /etc/localtime &&
hwclock --systohc && 
timedatectl set-ntp true &&
localectl set-keymap ru &&
setfont cyr-sun16 &&
localectl set-locale LANG="ru_RU.UTF-8" &&
echo "FONT=cyr-sun16"  >>  /etc/vconsole.conf &&
export LANG="ru_RU.UTF-8" &&
mkinitcpio -P &&
grub-mkconfig -o /boot/grub/grub.cfg &&


echo ' СОЗДАНИЕ ПОЛЬЗОВАТЕЛЕЙ'

useradd -m -g users -G audio,games,lp,optical,power,scanner,storage,video,wheel -s /bin/bash $USER &&
echo 'ВВЕДИТЕ ПАРОЛЬ ДЛЯ НОВОГО ПОЛЬЗОВАТЕЛЯ: '
passwd $USER

echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers &&
clear




echo 'ВСЕ ДАЛЬНЕЙШИЕ ДЕЙСТВИЯ ПРОВОДЯТСЯ ИЗ ПОД ПРОСТОГО ПОЛЬЗОВАТЕЛЯ!'
echo '========================================================================'
echo 'ВСЕ ДАЛЬНЕЙШИЕ ДЕЙСТВИЯ ПРОВОДЯТСЯ ИЗ ПОД ПРОСТОГО ПОЛЬЗОВАТЕЛЯ!'
echo '========================================================================'
echo 'ВСЕ ДАЛЬНЕЙШИЕ ДЕЙСТВИЯ ПРОВОДЯТСЯ ИЗ ПОД ПРОСТОГО ПОЛЬЗОВАТЕЛЯ!'
echo '========================================================================'



echo '=================================================='
echo 'УСТАНОВКА ДРАЙВЕРА ВИДЕО' 
echo 'НЕ ОТХОДИТЕ ОТ КОМПЬЮТЕРА (если устанавливаете Арч на компьютер) 
системе потребуется ввод пароля' 
echo $USER 
echo 'и возможно какие то ваши осмысленные манипуляции...'



echo 'Видеокарта Nvidia(1) или Radeon(0) 

read -p "1 - Nvidia, 0 - Radeon: " GPU
if [[ $GPU == 0 ]]; then
  video_install="git clone https://aur.archlinux.org/catalyst.git && cd catalyst && makepkg -sri"
elif [[ $GPU == 1 ]]; then
  video_install="sudo pacman -Syu nvidia"
fi

echo 'Установка X-Server'
sudo pacman -Syu --noconfirm xorg-server xorg-xinit xorg-apps xterm mesa-libgl


echo 'ШРИФТЫ'
sudo pacman -S ttf-font-awesome ttf-liberation ttf-dejavu opendesktop-fonts ttf-bitstream-vera ttf-arphic-uming ttf-hanazono ttf-arphic-ukai








