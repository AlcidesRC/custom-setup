###
# CALENDAR RELATED
###

# Reveal week numbers in the Gnome calendar
gsettings set org.gnome.desktop.calendar show-weekdate true

###
# DOCK RELATED
###

# Dock related
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 48
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock show-favorites true

# Revert
#gsettings reset org.gnome.shell.extensions.dash-to-dock extend-height
#gsettings reset org.gnome.shell.extensions.dash-to-dock dock-position
#gsettings reset org.gnome.shell.extensions.dash-to-dock dash-max-icon-size
#gsettings reset org.gnome.shell.extensions.dash-to-dock transparency-mode
#gsettings reset org.gnome.shell.extensions.dash-to-dock dock-fixed
#gsettings set org.gnome.shell.extensions.dash-to-dock show-favorites false

###
# DESKTOP RELATED
###

# Center new app windows
gsettings set org.gnome.mutter center-new-windows true

# Hide home icon in desktop
gsettings set org.gnome.shell.extensions.ding show-home false

# Set FiraCode Nerd Font Mono as the default monospace font
gsettings set org.gnome.desktop.interface monospace-font-name 'FiraCode Nerd Font Mono 10'

