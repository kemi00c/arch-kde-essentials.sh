#!/bin/bash

# Update package database
sudo pacman -Syu --noconfirm

# Install yay AUR package manager
sudo pacman -S --needed --noconfirm base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# Install Octopi GUI package manager
yay -S --noconfirm octopi

# Install KDE Connect
sudo pacman -S --noconfirm kdeconnect sshfs
# Open firewall for KDE Connect
sudo ufw allow 1714:1764/udp
sudo ufw allow 1714:1764/tcp

# Install Chinese, Japanese, Korean fonts for compatibility
sudo pacman -S --noconfirm noto-fonts-cjk

# Install Flatpak
sudo pacman -S --noconfirm flatpak

# Install fuse2 (needed for running AppImages)
sudo pacman -S --noconfirm fuse2

# Install manual pages
sudo pacman -S --noconfirm man-db

# Install the official Arch Linux wallpaper pack
sudo pacman -S --noconfirm archlinux-wallpaper

echo "Initial configuration and installation of essential packages completed. Please reboot your system now."
