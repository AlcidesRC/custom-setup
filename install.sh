# Exit immediately if a command exits with a non-zero status
set -e

# Check the distribution name and version and abort if incompatible
source ~/.local/share/custom-setup/install_check-version.sh

# Ensure computer doesn't go to sleep or lock while installing
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

#---

echo -e "🔸 Installing fonts..."
source ~/.local/share/custom-setup/tools/fonts/install.sh

#---

echo -e "🔸 Setting some defaults..."
source ~/.local/share/custom-setup/setup/setup-gnome-settings.sh
source ~/.local/share/custom-setup/setup/setup-aliases.sh
source ~/.local/share/custom-setup/setup/setup-shell.sh
source ~/.local/share/custom-setup/setup/setup-git.sh

#---

# Update OS dependency list


source ~/.local/share/custom-setup/tools/os-related/install.sh

choices=$(gum choose --no-limit "PhpStorm" "Docker" "LazyDocker" "LazyGit" "Typora" "Starship Terminal" --header "Choose your preferred application...")

for choice in $choices
do
  case $choice in
  "PhpStorm")
    source ~/.local/share/custom-setup/tools/phpstorm/install.sh
    ;;
  "Docker")
    source ~/.local/share/custom-setup/tools/docker/install.sh
    ;;
  "LazyDocker")
    source ~/.local/share/custom-setup/tools/lazydocker/install.sh
    source ~/.local/share/custom-setup/defaults/app-lazydocker.sh
    ;;
  "LazyGit")
    source ~/.local/share/custom-setup/tools/lazygit/install.sh
    source ~/.local/share/custom-setup/defaults/app-lazygit.sh
    ;;
  "LazyDocker")
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
