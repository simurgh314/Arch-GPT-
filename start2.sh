#!/bin/bash

echo '====================================='
read -p "Введите имя компьютера: " HOST
read -p "Введите имя нового пользователя" USER
read -p "Укажите часовой пояс в формате  Europe/Moscow  " POYAS


echo 'ЛОКАЛИЗАЦИЯ ЧАСЫ и ПРОЧЕЕ' 

hostnamectl set-hostname $HOST &&
ln -sf /usr/share/zoneinfo/$POYAS/etc/localtime &&
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
exit



echo 'ВСЕ ДАЛЬНЕЙШИЕ ДЕЙСТВИЯ ПРОВОДЯТСЯ ИЗ ПОД ПРОСТОГО ПОЛЬЗОВАТЕЛЯ!'
echo '========================================================================'
echo 'ВСЕ ДАЛЬНЕЙШИЕ ДЕЙСТВИЯ ПРОВОДЯТСЯ ИЗ ПОД ПРОСТОГО ПОЛЬЗОВАТЕЛЯ!'
echo '========================================================================'
echo 'ВСЕ ДАЛЬНЕЙШИЕ ДЕЙСТВИЯ ПРОВОДЯТСЯ ИЗ ПОД ПРОСТОГО ПОЛЬЗОВАТЕЛЯ!'
echo '========================================================================'

sudo pacman -Syu --noconfirm xorg-server xorg-xinit xorg-apps xterm mesa-libgl	





# УСТАНОВКА ДРАЙВЕРА ВИДЕО
------------------------------
трам-пам-пам
пам-пам
трам-пам-пам
Трамп!




# ШРИФТЫ
--------------
sudo pacman -S ttf-font-awesome ttf-liberation ttf-dejavu opendesktop-fonts ttf-bitstream-vera ttf-arphic-uming ttf-hanazono ttf-arphic-ukai











=========================================================================
# СЕТЬ (вручную)

read -p "Введите имя сети: " essid
read -p "Введите пароль: " passwd
read -p "Введите имя компьютера: " hostname

iface = ( ifconfig | cut -d ' ' -f1| tr ':' '\n' | awk NF | grep wl )
iwctl --passphrase $passwd station $iface connect $essid 
ping ya.ru -c 4



===========================================================================
# SSH (вручную)
------------------
passwd пароль_рут
nano /etc/ssh/sshd_config

-------
Port 22
PasswordAuthentication yes
-------

systemctl restart sshd.service
