# Exit immediately if a command exits with a non-zero status
set -e

# Check the distribution name and version and abort if incompatible
source ~/.local/share/custom-setup/install_check-version.sh

# Ensure computer doesn't go to sleep or lock while installing
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

#---

echo -e "\n\n🔸 Installing Fonts..."
source ~/.local/share/custom-setup/tools/fonts/install.sh

#---

echo -e "\n\n🔸 Setup Gnome settings..."
source ~/.local/share/custom-setup/setup/setup-gnome-settings.sh

echo -e "\n\n🔸 Setup aliases..."
source ~/.local/share/custom-setup/setup/setup-aliases.sh

echo -e "\n\n🔸 Setup Git..."
source ~/.local/share/custom-setup/setup/setup-git.sh

#---

echo -e "\n\n🔸 Installing eza..."
source ~/.local/share/custom-setup/tools/eza/install.sh

echo -e "\n\n🔸 Installing fd-find..."
source ~/.local/share/custom-setup/tools/fd-find/install.sh

echo -e "\n\n🔸 Installing fzf..."
source ~/.local/share/custom-setup/tools/fzf/install.sh

#---

echo -e "\n\n🔸 Installing Typora..."
source ~/.local/share/custom-setup/tools/typora/install.sh

echo -e "\n\n🔸 Installing LazyGit..."
source ~/.local/share/custom-setup/tools/lazygit/install.sh

#echo -e "\n\n🔸 Installing Docker..."
#source ~/.local/share/custom-setup/tools/docker/install.sh

#echo -e "\n\n🔸 Installing LazyDocker..."
#source ~/.local/share/custom-setup/tools/lazydocker/install.sh

echo -e "\n\n🔸 Installing Starship terminal..."
source ~/.local/share/custom-setup/tools/terminal/install.sh

#---

# Revert to normal idle and lock settings
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300

# Logout to pickup changes
#gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot
