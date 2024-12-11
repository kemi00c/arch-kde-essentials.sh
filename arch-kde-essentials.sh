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
sudo pacman -S plymouth
sudo pacman -S plymouth-kcm
