# Exit immediately if a command exits with a non-zero status
set -e

# Check the distribution name and version and abort if incompatible
source ~/.local/share/custom-setup/install_check-version.sh

# Ensure computer doesn't go to sleep or lock while installing
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

#---

source ~/.local/share/custom-setup/setup/setup-aliases.sh
source ~/.local/share/custom-setup/setup/setup-profile.sh
source ~/.local/share/custom-setup/setup/setup-shell.sh
source ~/.local/share/custom-setup/setup/setup-git.sh
source ~/.local/share/custom-setup/setup/setup-gnome-settings.sh
source ~/.local/share/custom-setup/tools/os-related/install.sh
source ~/.local/share/custom-setup/tools/fonts/install.sh

themes=$(gum choose --no-limit "DarkTheme" "LightTheme" --header "Choose your preferred theme...")
for theme in $themes
do
  case $theme in
  "DarkTheme")
    source ~/.local/share/custom-setup/setup/themes/setup-dark-theme.sh
    ;;
  "LightTheme")
    source ~/.local/share/custom-setup/setup/themes/setup-light-theme.sh
    ;;
  esac
done
echo ''

apps=$(gum choose --no-limit "PhpStorm" "Docker" "LazyDocker" "LazyGit" "Typora" "Starship" --header "Choose your preferred application...")
for app in $apps
do
  case $app in
  "PhpStorm")
    source ~/.local/share/custom-setup/tools/phpstorm/install.sh
    source ~/.local/share/custom-setup/defaults/app-phpstorm.sh
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
  "Typora")
    source ~/.local/share/custom-setup/tools/typora/install.sh
    ;;
  "Starthip")
    source ~/.local/share/custom-setup/tools/starship-rs/install.sh
    ;;
  esac
done
echo ''

#---

# Revert to normal idle and lock settings
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300

# Logout to pickup changes
gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot
