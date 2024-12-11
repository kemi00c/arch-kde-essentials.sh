#!/bin/bash

# Update package database
sudo pacman -Syu

# Install yay AUR package manager
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

# Install pamac GUI package manager
yay pamac-aur
yay pamac-tray-icon-plasma

# Install Plymouth splash screen
sudo pacman -S plymouth plymouth-kcm

# Configure the splash screen in the boot parameters
if ! grep -q "GRUB_CMDLINE_LINUX_DEFAULT.*splash" /etc/default/grub
then
    sudo sed -i "s/\(GRUB_CMDLINE_LINUX_DEFAULT=\"[^\"]*\)/\1 splash/" /etc/default/grub
fi
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Install essential KDE components
sudo pacman -S gwenview okular kwallet kdeconnect

# Install Flatpak
sudo pacman -S flatpak

# Install Firefox
sudo pacman -S firefox
