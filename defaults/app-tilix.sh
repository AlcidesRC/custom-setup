cat <<EOF >~/.local/share/applications/Tilix.desktop
[Desktop Entry]
Version=1.0
Name=Tilix
Comment=Manage your terminal with Tilix
Exec=tilix
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/custom-setup/defaults/icons/Tilix.png
Categories=GTK;
StartupNotify=false
EOF
