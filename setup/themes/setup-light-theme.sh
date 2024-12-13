echo ''
gum log --structured --level info "Setup light theme..."
echo ''

# Set light theme
gsettings set org.gnome.shell.ubuntu color-scheme prefer-light
gsettings set org.gnome.desktop.interface color-scheme prefer-light

# Set theme
gsettings set org.gnome.desktop.interface gtk-theme Yaru-blue

# Set wallpaper
gsettings set org.gnome.desktop.background picture-uri file:///home/$USER/.local/share/custom-setup/defaults/wallpapers/light.jpg