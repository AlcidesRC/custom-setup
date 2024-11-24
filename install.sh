# Exit immediately if a command exits with a non-zero status
set -e

# Check the distribution name and version and abort if incompatible
source ~/.local/share/custom-setup/install/check-version.sh

# Ensure computer doesn't go to sleep or lock while installing
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0


echo "\n\n🔸 Installing fonts..."
source ~/.local/share/custom-setup/install/install-fonts.sh

echo "\n\n🔸 Installing terminal..."
source ~/.local/share/custom-setup/install/install-terminal.sh


# Revert to normal idle and lock settings
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300
