gum log --structured --level info "Setup dark theme..."
echo ''

# Set dark theme
gsettings set org.gnome.shell.ubuntu color-scheme prefer-dark
gsettings set org.gnome.desktop.interface color-scheme prefer-dark

# Set theme
gsettings set org.gnome.desktop.interface gtk-theme Yaru-purple-dark

# Set wallpaper
gsettings set org.gnome.desktop.background picture-uri-dark file:///home/$USER/.local/share/custom-setup/defaults/wallpapers/dark.jpg
