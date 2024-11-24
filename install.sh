# Exit immediately if a command exits with a non-zero status
set -e

# Check the distribution name and version and abort if incompatible
source ~/.local/share/custom-setup/install/check-version.sh

# Ensure computer doesn't go to sleep or lock while installing
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0


echo -e "\n\n🔸 Setup aliases..."
source ~/.local/share/custom-setup/setup/setup-aliases.sh

echo -e "\n\n🔸 Setup Git..."
source ~/.local/share/custom-setup/setup/setup-git.sh

echo -e "\n\n🔸 Installing Docker..."
#source ~/.local/share/custom-setup/install/install-docker.sh

echo -e "\n\n🔸 Installing Typora..."
#source ~/.local/share/custom-setup/install/install-typora.sh

echo -e "\n\n🔸 Installing tools..."
source ~/.local/share/custom-setup/install/install-tools.sh
source ~/.local/share/custom-setup/install/install-lazygit.sh
source ~/.local/share/custom-setup/install/install-lazydocker.sh

echo -e "\n\n🔸 Installing fonts..."
source ~/.local/share/custom-setup/install/install-fonts.sh

echo -e "\n\n🔸 Installing terminal..."
source ~/.local/share/custom-setup/install/install-terminal.sh


# Revert to normal idle and lock settings
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300

# Logout to pickup changes
#gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot
