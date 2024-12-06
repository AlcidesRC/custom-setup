cat <<EOF >~/.local/share/applications/LazyGit.desktop
[Desktop Entry]
Version=1.0
Name=LazyGit
Comment=Manage Git repository with LazyGit
Exec=lazygit
Terminal=true
Type=Application
Icon=/home/$USER/.local/share/custom-setup/defaults/icons/Git.png
Categories=GTK;
StartupNotify=false
EOF
