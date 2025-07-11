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

# Install pamac GUI package manager
yay -S --noconfirm pamac-aur pamac-tray-icon-plasma

# Install Plymouth splash screen
sudo pacman -S --noconfirm plymouth plymouth-kcm

# Install os-prober
sudo pacman -S --noconfirm os-prober

# Configure the splash screen in the boot parameters
if ! grep -q "GRUB_CMDLINE_LINUX_DEFAULT.*splash" /etc/default/grub
then
    sudo sed -i "s/\(GRUB_CMDLINE_LINUX_DEFAULT=\"[^\"]*\)/\1 splash/" /etc/default/grub
fi

# Enable OS Prober
if grep -q "^#GRUB_DISABLE_OS_PROBER=false" /etc/default/grub
then
    sudo sed -i "s/^#GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/" /etc/default/grub
fi

# Update GRUB config
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Install essential KDE components
sudo pacman -S --noconfirm gwenview okular kwallet kwalletmanager kdeconnect kcalc spectacle

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

# Install Firefox
sudo pacman -S --noconfirm firefox

# Install and configure services for printer support
sudo pacman -S --noconfirm system-config-printer
sudo pacman -S --noconfirm cups
sudo systemctl enable avahi-daemon.service
sudo systemctl start avahi-daemon.service
sudo systemctl enable cups.service
sudo systemctl start cups.service

echo "Initial configuration and installation of essential packages completed. Please reboot your system now."
