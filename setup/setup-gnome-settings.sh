echo ''
gum log --structured --level info "Setup Gnome settings..."
echo ''

###
# CALENDAR RELATED
###

# Reveal week numbers in the Gnome calendar
gsettings set org.gnome.desktop.calendar show-weekdate true

###
# DESKTOP RELATED
###

# Center new app windows
gsettings set org.gnome.mutter center-new-windows true

# Hide home icon in desktop
gsettings set org.gnome.shell.extensions.ding show-home false

# Set CaskaydiaCove Nerd Font Mono as the default monospace font
gsettings set org.gnome.desktop.interface monospace-font-name 'CaskaydiaCove Nerd Font Mono 10'

###
# DOCK RELATED
###

# Dock related
# Revert with: gsettings reset org.gnome.shell.extensions.dash-to-dock extend-height
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 48
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock show-favorites true
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false

# Custom apps
# Get the full list with: ls /usr/share/applications/  ~/.local/share/applications/
gsettings set org.gnome.shell favorite-apps "['snap-store_snap-store.desktop', 'org.gnome.Nautilus.desktop', 'Tilix.desktop', 'firefox_firefox.desktop', 'PhpStorm.desktop', 'LazyGit.desktop', 'LazyDocker.desktop', 'typora.desktop']"
