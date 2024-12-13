cat <<EOF >~/.local/share/applications/LazyDocker.desktop
[Desktop Entry]
Version=1.0
Name=LazyDocker
Comment=Manage Docker containers with LazyDocker
Exec=lazydocker
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/custom-setup/defaults/icons/Docker.png
Categories=GTK;
StartupNotify=false
EOF
