# Exit immediately if a command exits with a non-zero status
set -e

# Check the distribution name and version and abort if incompatible
source ~/.local/share/custom-setup/install_check-version.sh

# Ensure computer doesn't go to sleep or lock while installing
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

#---

gum confirm "Do you want to install OS-related tools?" && source ~/.local/share/custom-setup/tools/os-related/install.sh

#---

gum confirm "Do you want to setup Gnome settings?" && source ~/.local/share/custom-setup/setup/setup-gnome-settings.sh

gum confirm "Do you want to setup shell?" && source ~/.local/share/custom-setup/setup/setup-shell.sh

gum confirm "Do you want to setup bash aliases?" && source ~/.local/share/custom-setup/setup/setup-aliases.sh

gum confirm "Do you want to setup Git?" && source ~/.local/share/custom-setup/setup/setup-git.sh

#---

gum confirm "Do you want to install fonts?" && source ~/.local/share/custom-setup/tools/fonts/install.sh

#---

choices=$(gum choose --no-limit "LazyGit" "LazyDocker" "Docker" "Typora" "Starship Terminal" --header "Choose your preferred application...")

for choice in $choices
do
  case $choice in
  "LazyGit")
    source ~/.local/share/custom-setup/tools/lazygit/install.sh
    ;;
  "LazyDocker")
    source ~/.local/share/custom-setup/tools/lazydocker/install.sh
    ;;
  "Docker")
    source ~/.local/share/custom-setup/tools/docker/install.sh
    source ~/.local/share/custom-setup/tools/lazydocker/install.sh
    ;;
  "Typora")
    source ~/.local/share/custom-setup/tools/typora/install.sh
    ;;
  "Starthip Terminal")
    source ~/.local/share/custom-setup/tools/terminal/install.sh
    ;;
  esac
done

#---

# Revert to normal idle and lock settings
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300

# Logout to pickup changes
gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot
