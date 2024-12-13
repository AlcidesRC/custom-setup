gum log --structured --level info "Setup bash profile..."
echo ''

# Remove any previous symbolic link
[ -e ~/.bash_profile ] && unlink ~/.bash_profile

# Create the symbolic link
ln -s ~/.local/share/custom-setup/defaults/bash/profile ~/.bash_profile

# Reload the bashrc
source ~/.bashrc
