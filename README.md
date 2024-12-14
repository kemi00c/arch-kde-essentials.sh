# arch-kde-essentials.sh
A script for initial configuration and essential packages for a fresh Arch Linux install with KDE Plasma desktop
## Overwiew
This script configures and installs the following things:
- Installs and configures Plymouth boot splash screen
- Installs Pamac, a graphical package manager
- Installs os-prober, enables OS probing in GRUB, adds other operating systems to the GRUB menu if any exists
- Installs essential KDE apps: gwenview okular kwallet kwalletmanager kdeconnect and kcalc
- Installs Chinese, Korean and Japanese fonts for better compatibility
- Installs Flatpak
- Installs the official Arch Linux wallpaper pack
- Installs Firefox

## Executing
Execute this script as a normal user with administrator rights (sudoers).
Please note, a user password may be requested several times during execution.
A reboot is required after the script is successfully completed.
