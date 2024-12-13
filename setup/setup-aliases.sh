gum log --structured --level info "Setup bash aliases..."
echo ''

# Remove any previous symbolic link
[ -e ~/.bash_aliases ] && unlink ~/.bash_aliases

# Create the symbolic link
ln -s ~/.local/share/custom-setup/defaults/bash/aliases ~/.bash_aliases

# Reload the bashrc
source ~/.bashrc
